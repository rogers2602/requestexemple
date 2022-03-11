// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:requestexemple/model/Response.dart';
import 'package:requestexemple/provider/api/EndPoint.dart';

import '../../../../../model/ListResponse.dart';
import '../../../../../provider/api/Api.dart';

// Include generated file
part 'list_controller.g.dart';

// This is the class used by rest of your codebase
class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  @observable
  bool isLoading = true;
  @observable
  bool hasError = false;
  int requestCode = 200;
  String errorMsg = "";
  @observable
  List<PresetsListResponse> presetItems = [];

  init() async {
    presetItems = await presetsList();
  }

  Future<List<PresetsListResponse>> presetsList() async {
    isLoading = true;

    var response = await Api.get(endPoint: EndPoint.LIST);
    requestCode = response.statusCode;

    if (response.statusCode == 200) {
      isLoading = false;
      hasError = false;
      return Future.value(listResponseFromJson(response.body));
    } else {
      errorMsg = responseFromJson(response.body).resposta.toString();
      hasError = true;
      debugPrint('ERROR: ' + response.statusCode.toString() + '\nresponse: ' + response.body);
    }

    isLoading = false;
    return [];
  }
}

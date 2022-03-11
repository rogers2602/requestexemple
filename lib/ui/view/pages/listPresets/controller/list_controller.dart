// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
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
  @observable
  List<PresetsListResponse> presetItems = [];

  init() async {
    presetItems = await presetsList();
  }

  Future<List<PresetsListResponse>> presetsList() async {
    isLoading = true;
    var response = await Api.get(endPoint: EndPoint.LIST);

    if (response.statusCode == 200) {
      isLoading = false;
      return Future.value(listResponseFromJson(response.body));
    } else {
      hasError = true;
      debugPrint('ERROR: ' + response.statusCode.toString() + '\nresponse: ' + response.body);
    }

    isLoading = false;
    return [];
  }
}

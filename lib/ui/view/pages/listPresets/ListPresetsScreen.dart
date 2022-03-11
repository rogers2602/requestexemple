import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:requestexemple/ui/components/UiComponent.dart';
import 'package:requestexemple/ui/view/pages/listPresets/controller/list_controller.dart';

class ListPresets extends StatefulWidget {
  const ListPresets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListPresetsState();
  }
}

class ListPresetsState extends State<ListPresets> {
  ListPresetsState({Key? key});

  final ListController _listController = ListController();

  @override
  void initState() {
    super.initState();
    _listController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: UiComponent.customWidgets.textView(text: "ProfilesCam Presets"),
        ),
        body: Observer(
            builder: (_) => _listController.isLoading
                ? Center(
                    child: UiComponent.customWidgets.progressLoad(),
                  )
                : ListView.builder(
                    itemCount: _listController.presetItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UiComponent.presetItemUi.itemListXml(context, item: _listController.presetItems[index]);
                    })));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:requestexemple/ui/components/UiComponent.dart';

import '../../../model/ListResponse.dart';
import 'ColorsRandom.dart';

class PresetItemUi {
  Widget itemListXml(BuildContext context, {required PresetsListResponse item}) {
    final format = NumberFormat.compact(locale: 'pt_BR');
    var unlike = format.format(item.unlike?.length).replaceAll("mil", "k");
    var like = format.format(item.like?.length).replaceAll("mil", "k");

    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.96,
              height: 150,
              margin: const EdgeInsets.fromLTRB(4, 10, 2, 0),
              child: Stack(children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: item.img.toString(),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                placeholder: (context, url) => UiComponent.customWidgets.progressLoad(),
                                errorWidget: (context, url, error) => Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Image.asset(
                                        'assets/images/iconappc.png',
                                        height: MediaQuery.of(context).size.height * 0.05,
                                      ),
                                    ))))),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                            child: SizedBox(
                              height: 66,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 30, 5, 0),
                                            child: const Icon(
                                              MdiIcons.blockHelper,
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )))),
                item.chipCategory != ""
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: FilterChip(
                            backgroundColor: ColorsRandom.colorRandom(),
                            labelStyle: const TextStyle(color: Colors.black),
                            selected: false,
                            onSelected: (selected) {},
                            label: UiComponent.customWidgets.textView(
                              text: item.chipCategory.toString(),
                              font: "Semibold",
                              color: Colors.white,
                            ),
                            selectedColor: Colors.blueAccent,
                            checkmarkColor: Colors.black,
                          ),
                        ))
                    : Container(),
              ]),
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 6),
          margin: const EdgeInsets.fromLTRB(10, 0, 8, 0),
          decoration: UiComponent.styleElement.boxCardBottomPresets(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: UiComponent.customWidgets.textView(
                              text: item.titlePost.toString(),
                              size: 16,
                              color: Colors.black87,
                            ),
                          )),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                        child: UiComponent.customWidgets.textView(
                          size: 10,
                          text: "Data: ${item.date}",
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                        child: UiComponent.customWidgets.textView(
                          size: 10,
                          text: "Autor: ${item.autor}",
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  )),
              Flexible(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                MdiIcons.thumbUp,
                                color: Colors.black87,
                              ),
                            ),
                            UiComponent.customWidgets.textView(text: like, size: 10, color: Colors.black87)
                          ],
                        ),
                        Center(
                            child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          color: Colors.grey,
                          width: 0.5,
                          height: 25,
                        )),
                        Column(children: [
                          const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              MdiIcons.thumbDown,
                              color: Colors.black87,
                            ),
                          ),
                          UiComponent.customWidgets.textView(text: unlike, size: 10, color: Colors.black87)
                        ]),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

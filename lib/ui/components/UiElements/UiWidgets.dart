import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../AppColors.dart';

class UiWidgets {
  buttonGradient(
      {required String text,
      double size = 12,
      String font = "Regular",
      double width = 100,
      required List<Color> colors,
      bool loading = false,
      Function()? onClick}) {
    return loading
        ? progressLoad()
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(width, 50)),
                  backgroundColor: MaterialStateProperty.all(AppColors.primaryDarkColor),
                  elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                ),
                onPressed: onClick,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: size,
                      fontFamily: font,
                      color: Colors.white,
                    ),
                  ),
                )));
  }

  sideBySide({required Widget left, required Widget right, EdgeInsets? margin}) {
    return Container(
        margin: margin,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
            child: left,
          ),
          Expanded(
            child: right,
          ),
        ]));
  }

  textView({required String text, double? size, String font = "Regular", Color? color = Colors.black54, TextDecoration? decoration}) {
    return Text(text, style: TextStyle(fontFamily: font, fontSize: size, color: color, decoration: decoration));
  }

  progressLoad() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.deepOrange, valueColor: AlwaysStoppedAnimation<Color>(Colors.orange))));
  }

  Widget errorWidget(BuildContext context, {int? code, String? msg, Function()? onTryAgainClick}) {
    switch (code) {
      case 404:
        return _errorImgAndDescription(context, msg: msg, img: "assets/image/not_found.svg", onTryAgainClick: onTryAgainClick);
      case 408:
        return _errorImgAndDescription(context, msg: msg, img: "assets/image/notify.svg", onTryAgainClick: onTryAgainClick);
      default:
        return _errorImgAndDescription(context, msg: msg, img: "assets/image/error.svg", onTryAgainClick: onTryAgainClick);
    }
  }

  _errorImgAndDescription(BuildContext context, {String? img, String? msg, Function()? onTryAgainClick}) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          svgImage(context, svgPath: "$img", width: width * 0.6),
          Padding(padding: const EdgeInsets.all(20), child: textView(text: "$msg")),
          buttonGradient(text: "Tente novamente", colors: [Colors.cyan, Colors.cyan.shade900], onClick: onTryAgainClick)
        ],
      ),
    );
  }

  Widget textButtonView(
      {required String text, double? size, String font = "Regular", Color? color = Colors.black54, TextDecoration? decoration, Function()? onClick}) {
    return GestureDetector(child: textView(text: text, size: size, font: font, color: color, decoration: decoration), onTap: onClick);
  }

  Widget divider(
      {Color? color = Colors.grey, required double height, required double width, EdgeInsets margin = const EdgeInsets.fromLTRB(0, 8, 0, 0)}) {
    return Container(color: color, height: height, width: width, margin: margin);
  }

  svgImageButton(BuildContext context,
      {required String svgPath, double? width, double? height, EdgeInsets margin = const EdgeInsets.fromLTRB(0, 8, 0, 0), Function()? onClick}) {
    return Container(
        margin: margin,
        child: GestureDetector(
          onTap: onClick,
          child: SvgPicture.asset(
            svgPath,
            width: width,
            height: height,
          ),
        ));
  }

  svgImage(BuildContext context,
      {required String svgPath, double? width, double? height, EdgeInsets margin = const EdgeInsets.fromLTRB(0, 8, 0, 0)}) {
    return Container(
      margin: margin,
      child: SvgPicture.asset(
        svgPath,
        width: width,
        height: height,
      ),
    );
  }

  void showDialogMsgAnimated(BuildContext context, {required String title, String? content}) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      transitionBuilder: (context, a1, a2, widget2) => Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: _showDialogMsg(context, title: title, content: content),
        ),
      ),
      transitionDuration: const Duration(milliseconds: 240),
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) => Container(),
    );
  }

  Widget _showDialogMsg(BuildContext context, {required String title, String? content}) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          MdiIcons.close,
                          color: Colors.black54,
                        )),
                  )),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: textView(text: title, size: 18, color: Colors.black54),
                        ))),
              )
            ],
          )),
      shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(color: Colors.grey.shade700, height: 1),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: textButtonView(
              color: Colors.black54,
              text: content.toString(),
              size: 16,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                        child: textView(
                      color: Colors.white,
                      text: "Fechar",
                      font: "Semibold",
                      size: 14,
                    ))),
              )),
        ],
      ),
    );
    //   });
  }

  Widget animationTransition(
    BuildContext context, {
    required Animation<double> opacity,
    required bool startAnimation,
    required Widget child,
    Alignment? start,
    Alignment? end,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FadeTransition(
        opacity: opacity,
        child: AnimatedAlign(
          alignment: startAnimation ? end ?? Alignment.topLeft : start ?? Alignment.topRight,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: child,
        ),
      ),
    );
  }
}

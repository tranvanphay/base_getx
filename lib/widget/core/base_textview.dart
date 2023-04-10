import 'package:flutter/material.dart';

class BaseTextView extends StatelessWidget {
  String text;
  Color? backgroundColor;
  Color? textColor;
  double? fontSize;
  double? paddingVer;
  double? paddingHoz;
  FontWeight? fontWeight;
  TextAlign? textAlign = TextAlign.start;
  bool? isLink;
  bool? isOneLineText;

  BaseTextView(
      {Key? key,
      required this.text,
      this.isOneLineText,
      this.backgroundColor,
      this.textColor,
      this.paddingHoz,
      this.paddingVer,
      this.fontWeight,
      this.textAlign,
      this.isLink,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
          vertical: paddingVer ?? 0, horizontal: paddingHoz ?? 0),
      child: Text(
        text,
        softWrap: isOneLineText == true ? false : null,
        overflow: isOneLineText == true ? TextOverflow.ellipsis : null,
        style: TextStyle(
            decoration: isLink == true ? TextDecoration.underline : null,
            fontSize: fontSize,
            color: isLink == true ? Colors.blueAccent : textColor,
            fontWeight: fontWeight),
        textAlign: textAlign,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String textButton;
  final Color? buttonColor;
  final Color textColor;
  Function() onPressed;
  final bool hasIcon;
  final String? iconUrl;
  final bool? isFullWidth;
  final double? minWidth;
  final bool? isDisable;
  final double? borderRadius;
  final double? height;

  BaseButton(
      {Key? key,
      required this.textButton,
      required this.buttonColor,
      required this.textColor,
      required this.hasIcon,
      this.iconUrl,
      this.minWidth,
      this.isFullWidth,
      this.height,
      this.borderRadius,
      this.isDisable,
      required this.onPressed})
      : super(key: key);

  PhysicalModel _raisedButton() {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.grey.withAlpha(10),
      elevation: 16,
      color: Colors.transparent,
      child: MaterialButton(
        height: height,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: buttonColor,
        disabledColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius != null ? borderRadius! : 5),
        ),
        textColor: textColor,
        padding: hasIcon == true
            ? const EdgeInsets.only(left: 0, right: 0)
            : const EdgeInsets.only(left: 5, right: 5),
        minWidth: minWidth != null
            ? minWidth!
            : isFullWidth != null
                ? double.infinity
                : 0,
        onPressed: isDisable == true
            ? null
            : () {
                onPressed();
              },
        child: hasIcon == true
            ? Row(
                children: [
                  SmallImg(url: iconUrl!, iconSize: 20, needInternet: false),
                  hasIcon == true
                      ? const Padding(padding: EdgeInsets.only(right: 2))
                      : Container(),
                  Text(
                    textButton,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            : Text(
                textButton,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _raisedButton();
  }
}

class SmallImg extends StatelessWidget {
  final String url;
  final double iconSize;
  final bool needInternet;
  const SmallImg(
      {Key? key,
      required this.url,
      required this.iconSize,
      required this.needInternet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needInternet == true
        ? Image.network(
            url,
            height: iconSize,
            width: iconSize,
            fit: BoxFit.cover,
          )
        : Image.asset(
            url,
            height: iconSize,
            width: iconSize,
            fit: BoxFit.cover,
          );
  }
}

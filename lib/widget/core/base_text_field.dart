import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTextField extends StatelessWidget {
  final int? flex;
  final String? hint;
  final TextEditingController controller;
  final TextInputType textInputType;
  final FocusNode node;
  final FocusNode? focusNode;
  final bool? isOnlyInteger;
  final bool? isRequiredField;
  final bool? isSpecialTextFeild;
  final bool? isOnlyDouble;
  final bool? isDisable;
  final bool? justEnableColor;
  final int? maxLenght;
  final num? maxValue;
  final bool? needCounterText;
  final bool? isPasswordFiled;
  final double? height;
  final bool? isDense;
  final bool? notNeedLabel;
  final bool? notNeedHint;
  final Function()? onTap;

  const BaseTextField(
      {Key? key,
      this.height,
      this.flex,
      required this.hint,
      required this.controller,
      required this.textInputType,
      this.isRequiredField,
      this.isDense,
      this.notNeedLabel,
      this.maxValue,
      this.isOnlyInteger,
      this.isSpecialTextFeild,
      this.isOnlyDouble,
      this.maxLenght,
      this.notNeedHint = true,
      this.isDisable,
      this.justEnableColor,
      this.focusNode,
      this.onTap,
      this.needCounterText,
      this.isPasswordFiled,
      required this.node})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: SizedBox(
        height: height ?? 50,
        child: TextField(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          obscureText: isPasswordFiled == true,
          enableSuggestions: isPasswordFiled == true ? false : true,
          autocorrect: isPasswordFiled == true ? false : true,
          keyboardType: textInputType,
          focusNode: focusNode,
          style: TextStyle(
              color: isDisable == true
                  ? justEnableColor == true
                      ? Colors.black
                      : Colors.grey
                  : null),
          readOnly: justEnableColor == true ? true : false,
          enabled: isDisable == true ? false : true,
          maxLength: maxLenght,
          onEditingComplete: () => node.nextFocus(),
          onChanged: (value) {
            if ((isOnlyDouble == true || isOnlyInteger == true) &&
                maxValue != null) {
              if (value.isNotEmpty) {
                if (num.parse(value) > maxValue!) {
                  controller.text = maxValue.toString();
                }
              }
            }
          },
          inputFormatters: [
            isOnlyDouble == true
                ? FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                : FilteringTextInputFormatter.singleLineFormatter,
            isOnlyInteger == true
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter,
          ],
          decoration: InputDecoration(
              filled: true,
              isDense: isDense,
              fillColor: Colors.transparent,
              counterText: needCounterText == true ? null : "",
              hintText: notNeedHint == true ? null : hint,
              hintStyle: TextStyle(
                  color: isDisable == true ? Colors.grey[400]! : null),
              labelText: notNeedLabel == true ? null : hint,
              labelStyle: TextStyle(
                  color: isDisable == true ? Colors.grey[400]! : null),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 8.0.h, vertical: isDense == true ? 8.0.h : 0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: isDisable == true
                          ? Colors.grey[400]!
                          : Colors.grey))),
          controller: controller,
        ),
      ),
    );
  }
}

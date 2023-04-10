import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

class BaseDropdown extends StatelessWidget {
  final bool? needHint;
  String? hint;
  final int flex;
  final RxList<DropdownMenuItem<String>> listItem;
  final ValueSetter<String> onSelected;
  String? defaultValue;

  BaseDropdown(
      {this.needHint,
      this.hint,
      required this.flex,
      required this.listItem,
      this.defaultValue,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return _expandedDropdown();
  }

  Widget _expandedDropdown() {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 35.h,
        child: Obx(() => DropdownButtonFormField(
              value: defaultValue,
              isDense: true,
              isExpanded: true,
              items: listItem,
              decoration: InputDecoration(
                labelText: needHint == false ? null : hint,
                contentPadding: const EdgeInsets.only(
                    right: 10, top: 0, left: 10, bottom: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (item) {
                onSelected(item is String ? item : '');
                defaultValue = item is String ? item : '';
              },
            )),
      ),
    );
  }
}

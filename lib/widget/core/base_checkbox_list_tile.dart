import 'package:flutter/material.dart';

class BaseCheckBoxListTile extends StatefulWidget {
  final String title;
  final ValueSetter<bool> onCheck;
  bool? defaultValue;
  final double height;
  final int? flex;
  final bool? isDisable;

  BaseCheckBoxListTile({
    required this.title,
    required this.onCheck,
    required this.height,
    this.flex,
    this.isDisable,
    this.defaultValue,
  });

  @override
  _BaseCheckBoxListTileState createState() => _BaseCheckBoxListTileState();
}

class _BaseCheckBoxListTileState extends State<BaseCheckBoxListTile> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null) {
      _isChecked = widget.defaultValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }

  Widget _widget() {
    return Expanded(
      flex: widget.flex ?? 1,
      child: Container(
        height: widget.height,
        decoration: ShapeDecoration(
          color: widget.isDisable == true ? Colors.grey : Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: CheckboxListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.grey[700]),
          ),
          value: _isChecked,
          onChanged: widget.isDisable != true
              ? (value) {
                  setState(() {
                    widget.onCheck(!_isChecked);
                  });
                }
              : null,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:alloy/components/text_field_container.dart';
import 'package:alloy/constants.dart';

class RoundedInputPhoneField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputPhoneField({
    Key key,
    this.hintText,
    this.icon = Icons.phone,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

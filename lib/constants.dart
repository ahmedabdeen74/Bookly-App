import 'package:flutter/material.dart';
const kPrimaryColor = Color(0xff100b20);
const kTranstionDuration = Duration(milliseconds: 250);
void hideKeyboardFromScreen(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
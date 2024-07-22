import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: controller,
      //focusNode: widget.focusNode,
      //cursorColor: kPrimaryColor,
      onSubmitted: (data) {
      },
      decoration: InputDecoration(
       // filled: true,
       // fillColor: kGrey300Color,
        suffixIcon: const Icon(
          Icons.search,
        ),
        hintText: 'Search',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

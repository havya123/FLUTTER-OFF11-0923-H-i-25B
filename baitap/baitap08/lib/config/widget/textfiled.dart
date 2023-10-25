import 'package:baitap08/config/size_config.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context, height: 0.07),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xff3A3F47),
          borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Color(0xff67686D),
            )),
      ),
    );
  }
}

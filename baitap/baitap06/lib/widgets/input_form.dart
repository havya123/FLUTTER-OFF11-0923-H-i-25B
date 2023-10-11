import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  InputForm({
    this.prefixIcon,
    this.hintText = "",
    super.key,
    this.suffixIcon,
    this.obscure = false,
    this.suffixIconChanged,
    this.errorText = "",
  });
  Widget? prefixIcon, suffixIcon, suffixIconChanged;
  bool obscure;
  String hintText, errorText;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  late bool isShowEye;

  @override
  void initState() {
    isShowEye = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isShowEye,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter some text";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.obscure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isShowEye = !isShowEye;
                  });
                },
                child: widget.suffixIcon)
            : null,
      ),
    );
  }
}

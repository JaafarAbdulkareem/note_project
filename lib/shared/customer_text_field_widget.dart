import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/constant/string_constant.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomerFormFieldWidget extends StatelessWidget {
  const CustomerFormFieldWidget({
    super.key,
    required this.hint,
    this.validator,
    required this.controller,
    this.minLine = 1,
    this.maxLine = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onSaved,
    // this.onChange,
  });

  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String?)? onSaved;
  // final Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        onSaved: onSaved,
        // onChanged: onChange,
        style: TextStyle(fontSize: getResponsiveText(context, fontSize: 18)),
        obscureText: obscureText,
        obscuringCharacter: ConstantString.passwordSymbol,
        minLines: minLine,
        maxLines: maxLine,
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.all(getResponsiveText(context, fontSize: 10)),
          isDense:
              MediaQuery.sizeOf(context).width < ConstantSizeLayout.tabletLayout
                  ? true
                  : false,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  InputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(
        color: BorderColor.borderField,
      ),
    );
  }
}

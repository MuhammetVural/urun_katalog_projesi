import 'package:flutter/material.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';

TextField reuseableTextField(String text, bool isPasswordType, bool isEnabled,
    TextEditingController controller) {
  // bool _obsecureText = isPasswordType;
  return TextField(
    controller: controller,
    // obscureText: _obsecureText,
    obscureText: isPasswordType,
    enabled: isEnabled,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.grey,
    style: TextStyle(color: Colors.black54.withOpacity(0.8)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: ColorManager.textFieldGreyBackround,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

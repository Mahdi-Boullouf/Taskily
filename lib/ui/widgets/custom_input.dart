import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_strings.dart';
import 'package:tasks_app/ui/common/app_styles.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      required this.hintText,
      required this.controller,
      this.maxLines = 1,
      this.onChanged});

  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontFamily: AppStrings.fontName),
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: AppColors.strokeColor.withValues(alpha: .08),
        border: OutlineInputBorder(
            borderRadius: AppStyles.borderRadiusTiny,
            borderSide: BorderSide.none),
        hintText: hintText,
      ),
    );
  }
}

class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

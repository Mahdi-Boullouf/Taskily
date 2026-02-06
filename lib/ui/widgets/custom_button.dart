import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_strings.dart';
import 'package:tasks_app/ui/common/app_styles.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

enum ButtonType {
  filled,
  outlined,
  text,
}

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.isDisabled = false,
      this.isLoading = false,
      this.expanded = true,
      this.backgroundColor,
      this.foregroundColor,
      this.border,
      required this.onPressed,
      required this.child,
      this.buttonType = ButtonType.filled});
  final bool isDisabled;
  final bool isLoading;
  final bool expanded;
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final OutlinedBorder? border;
  final ButtonType buttonType;
  final double borderRadius = AppStyles.borderRadiusLargeValue;
  final String fontFamily = AppStrings.fontName;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (isDisabled &&
              (buttonType == ButtonType.filled ||
                  buttonType == ButtonType.text))
          ? 0.8
          : 1,
      child: SizedBox(
        width: expanded ? double.infinity : null,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                overlayColor: buttonType == ButtonType.text
                    ? Colors.transparent
                    : buttonType == ButtonType.outlined && isDisabled
                        ? Colors.transparent
                        : null,
                shadowColor:
                    buttonType == ButtonType.filled ? null : Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: border,
                backgroundColor: backgroundColor ?? AppColors.primary,
                foregroundColor: buttonType == ButtonType.outlined && isDisabled
                    ? AppColors.strokeColor.withValues(alpha: .4)
                    : foregroundColor ?? AppColors.white),
            onPressed: buttonType != ButtonType.outlined && isDisabled
                ? null
                : onPressed,
            child: isLoading ? const CircularProgressIndicator() : child),
      ),
    );
  }

  factory CustomButton.filled(
      {required VoidCallback onPressed,
      required String text,
      bool isDisabled = false,
      Color? backgroundColor,
      Color? foregroundColor}) {
    return CustomButton(
      onPressed: onPressed,
      buttonType: ButtonType.filled,
      isDisabled: isDisabled,
      backgroundColor: backgroundColor ?? AppColors.primary,
      foregroundColor: foregroundColor ?? AppColors.white,
      border: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusLargeValue),
        side: BorderSide.none,
      ),
      child: CustomText.bodyMedium(
        text: text,
        textColor: foregroundColor,
      ),
    );
  }
  factory CustomButton.outlined(
      {required VoidCallback onPressed,
      required String text,
      bool isDisabled = false,
      Color? foregroundColor}) {
    return CustomButton(
      onPressed: onPressed,
      isDisabled: isDisabled,
      buttonType: ButtonType.outlined,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor ?? AppColors.textColor,
      border: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusLargeValue),
        side: BorderSide(
          color: isDisabled
              ? AppColors.strokeColor.withValues(alpha: .4)
              : foregroundColor ?? AppColors.strokeColor,
        ),
      ),
      child: CustomText.bodyMedium(
        text: text,
        textColor: foregroundColor,
      ),
    );
  }

  factory CustomButton.text(
      {required VoidCallback onPressed,
      required String text,
      bool isDisabled = false,
      Color? foregroundColor}) {
    return CustomButton(
      onPressed: onPressed,
      isDisabled: isDisabled,
      buttonType: ButtonType.text,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor ?? AppColors.textColor,
      border: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius:
              BorderRadius.circular(AppStyles.borderRadiusLargeValue)),
      child: CustomText.bodyMedium(
        text: text,
        textColor: foregroundColor ?? AppColors.primary,
      ),
    );
  }
}

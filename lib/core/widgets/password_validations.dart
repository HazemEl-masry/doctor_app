import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          text: "Uppercase Letters: At least one (A-Z).",
          hasValidated: hasUpperCase,
        ),
        SizedBox(height: 2.0.h),
        buildValidationRow(
          text: "Lowercase Letters: At least one (a-z).",
          hasValidated: hasLowerCase,
        ),
        SizedBox(height: 2.0.h),
        buildValidationRow(
          text: "Special Characters: At least one (!, @, \$, &, *, #).",
          hasValidated: hasSpecialCharacters,
        ),
        SizedBox(height: 2.0.h),
        buildValidationRow(
          text: "Numbers: At least one (0-9).",
          hasValidated: hasNumber,
        ),
        SizedBox(height: 2.0.h),
        buildValidationRow(
          text: "Minimum Length: 12.",
          hasValidated: hasMinLength,
        ),
      ],
    );
  }

  Widget buildValidationRow({
    required String text,
    required bool hasValidated,
  }) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5.r, backgroundColor: Colors.grey),
        SizedBox(width: 6.0.w),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2.sp,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}

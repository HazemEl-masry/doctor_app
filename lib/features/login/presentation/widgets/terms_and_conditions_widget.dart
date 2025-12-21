import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(height: 2.0.h),
        children: [
          TextSpan(
            text: "By logging, you agree to our ",
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(text: "and ", style: TextStyles.font13GrayRegular),
          TextSpan(
            text: "PrivacyPolicy.",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}

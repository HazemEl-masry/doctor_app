import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/onboarding/presentation/widgets/doc_logo_and_name.dart';
import 'package:doctor_app/features/onboarding/presentation/widgets/doctor_image_and_text.dart';
import 'package:doctor_app/features/onboarding/presentation/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 66.0.h,
            bottom: 57.0.h
          ),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 40.0.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Column(
                  children: [
                    Text(
                      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.0.h),
                    const GetStartedButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
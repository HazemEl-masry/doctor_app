import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.push("/LoginScreen");
      },
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
        minimumSize: WidgetStatePropertyAll(
          Size(MediaQuery.of(context).size.width, 52.h),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.0.r),
          ),
        ),
      ),
      child: Text("Get Started", style: TextStyles.font16WhiteSemiBold),
    );
  }
}

import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/doc_logo_low_opacity.svg",
          width: 343.h,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withAlpha(0)
              ],
              begin: AlignmentGeometry.bottomCenter,
              end: AlignmentGeometry.topCenter,
              stops: const [0.14,0.4]
            )
          ),
          child: Image.asset("assets/images/onboarding_doctor.png"),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4
            ),
          ),
        )
      ],
    );
  }
}
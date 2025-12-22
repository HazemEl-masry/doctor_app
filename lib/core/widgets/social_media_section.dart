import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});
  static final List<SocialMediaButton> socialMediaButtons = [
    SocialMediaButton(onTap: () {}, image: "assets/svg/google.svg"),
    SocialMediaButton(onTap: () {}, image: "assets/svg/facebook.svg"),
    SocialMediaButton(onTap: () {}, image: "assets/svg/apple.svg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(thickness: 1.2, color: Colors.grey)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "Or sign in with",
                style: TextStyles.font14GrayRegular,
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(child: Divider(thickness: 1.2, color: Colors.grey)),
          ],
        ),
        SizedBox(height: 32.0.h),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 32.w,
          runSpacing: 16.h,
          children: socialMediaButtons,
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onTap,
    required this.image,
  });

  final void Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(image, width: 46.0.w),
    );
  }
}

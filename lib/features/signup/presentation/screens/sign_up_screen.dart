import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/core/widgets/social_media_section.dart';
import 'package:doctor_app/core/widgets/terms_and_conditions_widget.dart';
import 'package:doctor_app/features/signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:doctor_app/features/signup/presentation/cubits/cubit/signup_cubit.dart';
import 'package:doctor_app/features/signup/presentation/widgets/already_have_an_account_widget.dart';
import 'package:doctor_app/features/signup/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 95.0.h,
            bottom: 50.0.h,
            right: 24.0.w,
            left: 24.0.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Account", style: TextStyles.font24BlueBold),
              SizedBox(height: 8.0.h),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GrayRegular,
              ),
              SizedBox(height: 20.0.h),
              const SignUpForm(),
              SizedBox(height: 10.0.h),
              AppTextButton(
                buttonText: "Sign up",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenSignUp(context);
                },
              ),
              SizedBox(height: 30.0.h),
              const SocialMediaSection(),
              SizedBox(height: 20.0.h),
              const TermsAndConditionsWidget(),
              SizedBox(height: 20.0.h),
              const AlreadyHaveAnAccountWidget(),
              const SignupBlocListener()
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupState();
    }
  }
}

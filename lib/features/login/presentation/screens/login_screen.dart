import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/core/widgets/social_media_section.dart';
import 'package:doctor_app/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/widgets/dont_have_an_account_widget.dart';
import 'package:doctor_app/features/login/presentation/widgets/email_and_password.dart';
import 'package:doctor_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:doctor_app/core/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
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
              Text("Welcome Back", style: TextStyles.font24BlueBold),
              SizedBox(height: 8.0.h),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular,
              ),
              SizedBox(height: 35.0.h),
              const EmailAndPassword(),
              SizedBox(height: 18.0.h),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = !rememberMe;
                      });
                    },
                  ),
                  Text("Remember me", style: TextStyles.font14GrayRegular),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.font13BlueSemiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0.h),
              AppTextButton(
                buttonText: "Login",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenLogin(context);
                },
              ),
              SizedBox(height: 35.0.h),
              const SocialMediaSection(),
              SizedBox(height: 30.0.h),
              const TermsAndConditionsWidget(),
              SizedBox(height: 20.0.h),
              const DontHaveAnAccountWidget(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}

import 'package:doctor_app/core/helper/app_regex.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/core/widgets/password_validations.dart';
import 'package:doctor_app/features/signup/presentation/cubits/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  bool isObscureText2 = true;

  late TextEditingController passwordEditingController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordEditingController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordEditingController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordEditingController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordEditingController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordEditingController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordEditingController.text);
        hasMinLength = AppRegex.hasMinLength(passwordEditingController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          SizedBox(height: 16.0.h),
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          SizedBox(height: 16.0.h),
          AppTextFormField(
            hintText: "Phone",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          SizedBox(height: 16.0.h),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  isObscureText: isObscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                  controller: context.read<SignupCubit>().passwordController,
                ),
              ),
              SizedBox(width: 6.0.h),
              Expanded(
                child: AppTextFormField(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText2 = !isObscureText2;
                      });
                    },
                    icon: isObscureText2
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  isObscureText: isObscureText2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                  controller: context
                      .read<SignupCubit>()
                      .passwordConfirmationController,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}

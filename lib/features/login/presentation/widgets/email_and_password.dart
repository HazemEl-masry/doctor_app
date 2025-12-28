import 'package:doctor_app/core/helper/app_regex.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordEditingController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordEditingController = context
        .read<LoginCubit>()
        .passwordEditingController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordEditingController.addListener(() {
      setState(() {
        hasUpperCase = AppRegex.hasUpperCase(passwordEditingController.text);
        hasLowerCase = AppRegex.hasLowerCase(passwordEditingController.text);
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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter a valid email";
              }
            },
            controller: context.read<LoginCubit>().emailEditingController,
          ),
          SizedBox(height: 18.0.h),
          AppTextFormField(
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<LoginCubit>().passwordEditingController,
          ),
          SizedBox(height: 10.h),
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

  @override
  void dispose() {
    passwordEditingController.dispose();
    super.dispose();
  }
}

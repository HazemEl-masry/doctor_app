import 'package:doctor_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:doctor_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:doctor_app/features/signup/presentation/cubits/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signUpRepo) : super(const SignupState.initial());

  final SignUpRepo _signUpRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupState() async {
    emit(const SignupState.signupLoading());
    final response = await _signUpRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ""));
      },
    );
  }
}

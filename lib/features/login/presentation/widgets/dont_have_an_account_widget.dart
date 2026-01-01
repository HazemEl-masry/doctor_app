import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account yet?", style: TextStyles.font13GrayRegular),
        TextButton(
          onPressed: () {
            context.push("/SignUpScreen");
          },
          child: Text("Sign Up", style: TextStyles.font14BlueSemiBold),
        ),
      ],
    );
  }
}

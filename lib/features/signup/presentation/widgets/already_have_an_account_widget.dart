import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account !",
          style: TextStyles.font13GrayRegular,
        ),
        TextButton(
          onPressed: () {
            context.go("/LoginScreen");
          },
          child: Text("Login", style: TextStyles.font14BlueSemiBold),
        ),
      ],
    );
  }
}

import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_app/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_app/features/signup/presentation/cubits/cubit/signup_cubit.dart';
import 'package:doctor_app/features/signup/presentation/screens/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
    GoRoute(
      path: '/LoginScreen',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: "/SignUpScreen",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SignupCubit>(),
        child: const SignUpScreen(),
      ),
    ),
    GoRoute(
      path: "/HomeScreen",
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

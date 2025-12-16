import 'package:doctor_app/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
    GoRoute(
      path: '/LoginScreen',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

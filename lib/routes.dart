import 'package:get/get_navigation/src/routes/get_route.dart';

import 'globals.dart';
import 'main.dart';
import 'screens/chooseService/service_type_screen.dart';
import 'screens/forgotPassword/forgot_password_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/signup/signup_screen.dart';

getInitialRoute() {
  initialRoot = ServiceTypeScreen.routeName;
}

final List<GetPage<dynamic>> routes = [
  GetPage(name: MyApp.routeName, page: () => MyApp()),
  GetPage(name: ServiceTypeScreen.routeName, page: () => ServiceTypeScreen()),
  GetPage(name: OnboardingScreen.routeName, page: () => OnboardingScreen()),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(
      name: ForgotPasswordScreen.routeName, page: () => ForgotPasswordScreen()),
  GetPage(name: SignupScreen.routeName, page: () => SignupScreen()),
  GetPage(name: MapScreen.routeName, page: () => MapScreen()),
];

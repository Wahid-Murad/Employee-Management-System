import 'package:employee_management/utils/constants/imports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController splashScreenController = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    heightWidthKeyboardValue(context);
    return Scaffold(
      body: Image.asset(
        'assets/images/splashscreen.jpeg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

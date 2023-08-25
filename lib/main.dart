import 'package:employee_management/utils/constants/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BinderController().dependencies();
  await dotenv.load(fileName: Environment.fileName);
  ll(Environment.fileName.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: krSplashScreen,
      getPages: routes,
      // home: SplashScreen(),
    );
  }
}

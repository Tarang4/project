import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/user_side/config/app_colors.dart';
import 'package:untitled/user_side/screens/login%20screen/splash_screen.dart';

SharedPreferences? pref = SharedPreferences.getInstance() as SharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: colorGreen)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}


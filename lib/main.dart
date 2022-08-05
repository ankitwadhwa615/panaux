import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ttsf_cloud/screens/home_screen/dashboard.dart';
import 'package:ttsf_cloud/screens/home_screen/landing_screen.dart';
import 'package:ttsf_cloud/screens/login/login_screen.dart';

String token = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Box? box = await Hive.openBox('userBox');
  if (box.isNotEmpty) {
    token = box.get('token');
  }
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      debugShowCheckedModeBanner: false,
      title: 'TTSF Cloud',
      home: const SplashManager(),
    );
  }
}

class SplashManager extends StatelessWidget {
  const SplashManager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(
          [Future.delayed(const Duration(seconds: 1, milliseconds: 50))]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return (!snapshot.hasData)
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png',
                          width: 300, height: 300),
                    ],
                  ),
                ),
              )
            : token == ''
                ? const LoginScreen()
                : const LandingScreen()   ;   },
    );
  }
}

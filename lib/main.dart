// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:panaux_customer/screens/home_screen/dashboard.dart';
import 'package:panaux_customer/screens/login/login_screen.dart';
// import 'package:panaux_customer/screens/orders/new_order_details.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

String token = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance
  //     .setCrashlyticsCollectionEnabled(true);
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
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      debugShowCheckedModeBanner: false,
      title: 'Panaux',
      // home: OrderDetails(id: '6221a31f31d12e0016b6a9b0')
      home: SplashManager(),
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
                      Image.asset('assets/images/panaux-logo.png',
                          width: 300, height: 300),
                    ],
                  ),
                ),
              )
            : token == ''
                ? const LoginScreen()
                : const DashBoard();
      },
    );
  }
}

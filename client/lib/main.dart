import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/provider/AllProvider.dart';
import 'package:mybiseo_app/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: "142a2412217adca16ca893515805eaf3");
  runApp(ChangeNotifierProvider(
    create: (_) => AllProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyBiseo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Coloring.bg_color,
        ),
        home: SplashScreen());
  }
}

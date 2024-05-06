import 'package:finalproject/routes.dart';
import 'package:finalproject/screens/splash_screen/splash_screen.dart';
import 'package:finalproject/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context, orientation, device){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Final Projesi',
        theme: CustomTheme().baseTheme,
        initialRoute: SplashScreen.routeName,
        routes: routes,
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:newsapp/screens/splash_Screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiProvider>(
      create: (context) {
        return ApiProvider();
      },
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        home: const LaunchScreen(),
      ),
    );
  }
}

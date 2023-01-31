import 'package:flutter/material.dart';
import 'package:newsapp/provider/provider_api.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/bacwhite.jpg',
                    fit: BoxFit.cover,
                  )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/News.png'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/auth/register_screen.dart';
import 'package:newsapp/components/text_filed_widget.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navRegister;
  }

  void _navRegister() => AppRouter.goToScreen(const RegisterScreen());

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/bacwhite.jpg',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: 110,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login to start using app,',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 300,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    TextFieldWidget(
                      provider.loginEmailController,
                      'Email',
                      TextInputType.emailAddress,
                      const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        provider.loginPassWordController,
                        'PassWord',
                        TextInputType.visiblePassword,
                        const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        obscureText,
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black45,
                          ),
                        )),
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: TextButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         'Forget Password?',
                    //         style: TextStyle(
                    //           fontSize: 12,
                    //           color: Colors.black,
                    //         ),
                    //       )),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await provider.performLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 58),
                        primary: const Color(0xFF6A90F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(
                                  color: Color(0xFF9391A4), fontSize: 18)),
                          TextSpan(
                              recognizer: _tapGestureRecognizer,
                              text: 'Sign Up',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ],
                      )),
                    ),
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

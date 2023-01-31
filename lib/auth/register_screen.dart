
import 'package:flutter/material.dart';
import 'package:newsapp/components/text_filed_widget.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
//
class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

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
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              AppRouter.goPopScreen();
                            },
                            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          provider.registerFullNameController,
                          'Full Name',
                          TextInputType.name,
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          provider.registerEmailController,
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
                            provider.registerPasswordController,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text("Male",style: TextStyle(color: Colors.black),),
                                value: "M",
                                groupValue: provider.gender,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      provider.gender = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text("Female",style: TextStyle(color: Colors.black),),
                                value: "F",
                                groupValue: provider.gender,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      provider.gender = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await provider.register();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 58),
                            primary: const Color(0xFF6A90F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Sign Up'),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

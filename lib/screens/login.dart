import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/backend/api_clint.dart';
import 'package:test/const/color.dart';
import 'package:test/local/auth_utils.dart';
import 'package:test/model/login.dart';
import 'package:test/screens/home/home.dart';
import 'package:test/wigeds/circuler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  List<LoginModel> logins = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: buttionColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(color: secondryFont),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: isLoading ? null : _signIn,
                child: isLoading
                    ? const MyCircullerIndecator()
                    : Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text('Sign In',
                              style: TextStyle(
                                  color: fontWhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        // Create an instance of ApiClient
        ApiClient apiClient = ApiClient();

        // Call the login method on the ApiClient instance and await its result
        LoginModel loginResult = await apiClient.login(
          emailController.text,
          passwordController.text,
        );
        log('error related loginresult : ${loginResult.toJson().toString()}');
        // Check if login was successful based on the response
        if (loginResult.code != null &&
            (loginResult.code?.contains('1') ?? false)) {
          // Navigate to the home screen
          AuthUtils.saveLoginData(loginResult.data?.first.email ?? "", loginResult.data?.first.token ?? "",);
          AuthUtils.saveLoginModelData(loginResult);

          Get.to(() => HomeScreen(
                loginResult: loginResult,
              ));
        } else {
          // Handle unsuccessful login
          // Print an error message or display it to the user
          log('Login failed: ${loginResult.message ?? "Unknown error"}');
        }
      } catch (error) {
        // Handle errors occurred during login process
        // Print an error message or display it to the user
        log('Error during login: $error');
      }

      setState(() {
        isLoading = false;
      });
    }
  }
}

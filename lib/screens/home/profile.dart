import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test/const/color.dart';
import 'package:test/local/auth_utils.dart';
import 'package:test/model/login.dart';

class MyProfile extends StatefulWidget {
  final LoginModel? loginResult;

  const MyProfile({super.key, this.loginResult});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextStyle ts;
  LoginModel? loginResult;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      loginResult = await AuthUtils.getLoginData();
    });
    log(loginResult?.data?.first.profileImage ?? '');
    ts = const TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Dashboard',
                style: ts.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      loginResult?.data?.first.profileImage ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loginResult?.data?.first.name ?? '',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: secondryFont),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      loginResult?.data?.first.designation ?? '',
                      style: const TextStyle(color: secondryFont),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Center(child: Text('Scan Qr Code  for getting data')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

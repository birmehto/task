import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/const/color.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                    color: buttionColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.9,
                                color: Color.fromARGB(
                                  255,
                                  128,
                                  126,
                                  126,
                                ),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/person.svg',
                          height: 30,
                        ),
                        title: const Text(
                          'My Profile',
                          style: TextStyle(color: fontWhite),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: fontWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.9,
                                color: Color.fromARGB(
                                  255,
                                  128,
                                  126,
                                  126,
                                ),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/cpass.svg',
                          height: 30,
                        ),
                        title: const Text(
                          'Change Password',
                          style: TextStyle(color: fontWhite),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: fontWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.9,
                                color: Color.fromARGB(
                                  255,
                                  128,
                                  126,
                                  126,
                                ),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/holiday.svg',
                          height: 30,
                        ),
                        title: const Text(
                          'Holidays',
                          style: TextStyle(color: fontWhite),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: fontWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.9,
                                color: Color.fromARGB(
                                  255,
                                  128,
                                  126,
                                  126,
                                ),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/privacy-policy.svg',
                          height: 30,
                        ),
                        title: const Text(
                          'Privacy policy',
                          style: TextStyle(color: fontWhite),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: fontWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: buttionColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.9,
                                color: Color.fromARGB(
                                  255,
                                  128,
                                  126,
                                  126,
                                ),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/leave-policy.svg',
                          height: 30,
                        ),
                        title: const Text(
                          'Leave Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: fontWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

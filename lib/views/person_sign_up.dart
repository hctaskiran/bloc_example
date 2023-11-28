// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_pattern_flutter_ornek/constants.dart';
import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignUpPage> {
  var Name = TextEditingController();
  var Phone = TextEditingController();
  Future<void> save(String name, String phone) async {
    print('name: $name, phone: $phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Sign Up',
              speed: const Duration(milliseconds: 120),
            ),
          ],
          pause: const Duration(seconds: 3),
          repeatForever: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Icon(
                Icons.account_circle_sharp,
                size: 150,
                color: ColorConst().amber,
              ),
              const SizedBox(height: 60),
              TextField(
                controller: Name,
                decoration: InputDecoration(
                  prefixIcon: signUpIcons[0],
                  hintText: 'Enter a Name',
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.phone,
                controller: Phone,
                decoration: InputDecoration(
                  prefixIcon: signUpIcons[1],
                  hintText: 'Enter a Phone Number',
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  save(Name.text, Phone.text);
                  HomePageCubit().addPerson(Name.text, Phone.text);
                  if (MyAppStates().isError = true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: ColorConst().red800,
                        content: const Text("Process failed. Please check the information you entered."),
                        action: SnackBarAction(
                          backgroundColor: ColorConst().white,
                          label: "Try Again",
                          textColor: ColorConst().blue,
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: ColorConst().green700,
                        content: const Text("Process successfuly completed."),
                        action: SnackBarAction(
                          backgroundColor: ColorConst().white,
                          textColor: ColorConst().blue,
                          label: "OK",
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Sign Up!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

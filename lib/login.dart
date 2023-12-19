import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login() async {
    String url = "https://alirezaarbabi.wiki/ESP32CAM/login_users.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'success') {
        // لاگین موفقیت‌آمیز
        print(data['message']);
        print('user enter');
         await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Login Successfully!',
        );
        // انتقال به صفحه بعدی
        Navigator.pushNamed(context, '/home');
      } else {
        // خطا در لاگین
        print(data['message']);

        // نمایش پیام خطا
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: data['message'],
        );
      }
    } else {
      print("خطا در ارسال درخواست");

      // نمایش پیام خطا
      await QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: "خطا در ارسال درخواست",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, top: 150),
              child: Row(
                children: [
                  const Text(
                    'Welcome\nBack',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/img/login-icon.png',
                    width: 110,
                    height: 110,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(77, 236, 212, 212),
                              filled: true,
                              hintText: "Username",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(211, 0, 0, 0)),
                              prefixIcon: const Icon(Icons.person_2_sharp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(77, 236, 212, 212),
                              filled: true,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(211, 0, 0, 0)),
                              prefixIcon: const Icon(Icons.lock_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                                // backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.black,
                                    onPressed: () async {
                                      _login();
                                      // await QuickAlert.show(
                                      //   context: context,
                                      //   type: QuickAlertType.success,
                                      //   text: 'Login Successfully!',

                                      // );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

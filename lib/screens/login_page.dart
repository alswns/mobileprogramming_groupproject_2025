import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobileprogramming_groupproject_2025/screens/singUp_page.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

// 토큰 저장

final dio = Dio();

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String email = "", password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset('assets/images/logo_image.svg'),
            Image.asset(
              "assets/images/logo_image.png",
              width: 400,
              height: 400,
            ),

            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.grey,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.0),

                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) => email = value,
                        decoration: InputDecoration(labelText: 'Enter email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        onChanged: (value) => password = value,
                        decoration: InputDecoration(
                          labelText: 'Enter password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                      ),
                      SizedBox(height: 40.0),

                      ElevatedButton(
                        onPressed: () async {
                          final response = await singInAction(email, password);
                          if (response == true && context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/main',
                              (Route<dynamic> route) => false, // 이전 모든 라우트 제거
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // 배경색
                          foregroundColor: Colors.white, // 글자색
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ), // 최소 크기 (너비, 높이)
                          elevation: 5, // 그림자 깊이
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // 둥근 모서리
                          ),

                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF44A8BF),
                          ),
                        ),
                        child: const Text('Login'),
                      ),

                      SizedBox(height: 10.0),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingupPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // 배경색
                          foregroundColor: Colors.blue, // 글자색
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ), // 최소 크기 (너비, 높이)
                          elevation: 5, // 그림자 깊이

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // 둥근 모서리
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),

                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF44A8BF),
                          ),
                        ),
                        child: const Text('Sing Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> singInAction(String email, String password) async {
  try {
    final response = await dio.post(
      'http://52.78.1.108:8080/users/login',
      data: {"email": email, "password": password},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Success!!");
      Map<String, dynamic> data = response.data;
      final refreshToken = data['refresh_token'] as String;
      final accessToken = data['access_token'] as String;

      await storage.write(key: 'access_token', value: accessToken);
      await storage.write(key: 'refresh_token', value: refreshToken);

      return true;
    }
    return false;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) Fluttertoast.showToast(msg: "error");
    return false;
  }
}

void SingOutAction(String email, String password) {}

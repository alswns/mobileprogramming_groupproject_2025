import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class SingupPage extends StatefulWidget {
  SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPage();
}

class _SingupPage extends State<SingupPage> {
  String email = "", password = "", username = "";
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
                        style: TextStyle(fontSize: 18, height: 2),
                      ),
                      TextField(
                        onChanged: (value) => username = value,
                        decoration: InputDecoration(
                          labelText: 'Enter username',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 18, height: 2),
                      ),
                      TextField(
                        onChanged: (value) => password = value,
                        decoration: InputDecoration(
                          labelText: 'Enter password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                        style: TextStyle(fontSize: 18, height: 2),
                      ),

                      SizedBox(height: 40.0),

                      SizedBox(height: 10.0),

                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final response = await dio.post(
                              'http://52.78.1.108:8080/users/register',
                              data: {
                                "email": email,
                                "username": username,
                                "password": password,
                              },
                            );
                            print(response.statusCode);
                            if (response.statusCode == 201) {
                              Fluttertoast.showToast(msg: "Sucess!!");
                              Navigator.pop(context);
                            }
                          } on DioException catch (e) {
                            if (e.response?.statusCode == 400)
                              Fluttertoast.showToast(
                                msg: "already exist email",
                              );
                          }
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

void SingOutAction(String email, String username, String password) {}

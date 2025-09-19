import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
                  padding: EdgeInsets.all(40.0),
                  // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                  // SingleChildScrollView으로 감싸 줌
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Enter email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter password',
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true, // 비밀번호 안보이도록 하는 것
                        ),
                        SizedBox(height: 40.0),

                        ElevatedButton(
                          onPressed: () {
                            print('login button');
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
                            print('Sing In button');
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
            ),
          ],
        ),
      ),
    );
  }
}

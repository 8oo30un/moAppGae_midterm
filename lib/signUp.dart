import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // 폼 검증을 위한 키
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // 사용자 이름 검증 함수
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    // 알파벳 문자 3개 이상, 숫자 3개 이상인지 확인
    final RegExp usernameRegExp =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$');
    if (!usernameRegExp.hasMatch(value)) {
      return 'Username is invalid';
    }
    return null;
  }

  // 비밀번호 검증 함수
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  // 비밀번호 확인 검증 함수
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password cannot be empty';
    }
    if (value != _passwordController.text) {
      return "Confirm Password doesn't match Password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey, // Form 키 추가
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                validator: _validateUsername, // 사용자 이름 검증 추가
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: _validatePassword, // 비밀번호 검증 추가
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: _validateConfirmPassword, // 비밀번호 확인 검증 추가
              ),
              const SizedBox(height: 24.0),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      _confirmPasswordController.clear();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('SIGN UP'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // 모든 필드가 유효하면 동작 실행
                        Navigator.pop(context); // 로그인 페이지로 돌아가기
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

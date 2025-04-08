import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Center(
        child: Text(
          '회원가입 페이지입니다.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

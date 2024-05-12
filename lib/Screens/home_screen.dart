import 'package:flutter/material.dart';
import 'package:login_screen/components/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            emailTextEditingController.clear();
            passwordTextEditingController.clear();
            obscureText = true;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xff686668),
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome ${emailTextEditingController.text}',
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff686668),
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

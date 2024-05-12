import 'package:flutter/material.dart';
import 'package:login_screen/Screens/home_screen.dart';
import 'package:login_screen/models/user_model.dart';

import '../components/constant.dart';
import '../components/text_form_field_components.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldComponents(
            hintText: 'Enter Your Email',
            labelText: 'Email',
            prefixIcon: Icons.email,
            controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email must not be empty';
              }
              return null;
            },
          ),
          TextFieldComponents(
            hintText: 'Enter Your Password',
            labelText: 'Password',
            obscureText: obscureText,
            suffixIconOnPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            prefixIcon: Icons.lock,
            suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
            controller: passwordTextEditingController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'password must not be empty';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: const Size(double.infinity, 50),
              ),
              onPressed: () => onPressedLogin(),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validEmail() {
    for (UserModel user in userModel) {
      if (emailTextEditingController.text == user.email) {
        return true;
      }
    }
    return false;
  }

  bool validPassword() {
    for (UserModel user in userModel) {
      if (passwordTextEditingController.text == user.password) {
        return true;
      }
    }

    return false;
  }

  void onPressedLogin() {
    if (formKey.currentState!.validate()) {
      if (validEmail() && validPassword()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        message = '';
      }
      if (emailTextEditingController.text.isEmpty ||
          passwordTextEditingController.text.isEmpty) {
        message = '';
      } else {
        if (validEmail()) {
          if (validPassword()) {
          } else {
            message = 'Password not Correct';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orange,
                content: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        } else {
          message = 'Email not Correct';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orange,
              content: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      }
      setState(() {});
    }
  }
}

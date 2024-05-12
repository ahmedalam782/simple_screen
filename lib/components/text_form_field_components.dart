import 'package:flutter/material.dart';

class TextFieldComponents extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final Function()? suffixIconOnPressed;

  const TextFieldComponents({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    required this.controller,
    this.suffixIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Timmana',
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.orange,
          ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              suffixIcon,
              color: Colors.orange,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xff686668),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.orange,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xff686668),
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 18,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  required String hintText,
  bool isPassword = false,
  bool showSuffixIcon = false,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: showSuffixIcon
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
                color: Colors.white,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7ede6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
      validator: validator,
      obscureText: isPassword,
    );

Widget defaultButton({
  required VoidCallback function,
  required Widget child,
}) =>
    GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: child,
        ),
      ),
    );

void showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("No Internet Connection"),
        content: Text("Please check your internet connection."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
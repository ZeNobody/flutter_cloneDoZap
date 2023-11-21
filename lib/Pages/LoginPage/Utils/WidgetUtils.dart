import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget buildTextField(
      String label, {
        String hintText = '',
        bool obscureText = false,
        TextEditingController? controller,
        TextInputType? keyboardType,
      }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 10),
        ),
      ),
    );
  }

  static Widget buildElevatedButton(String text, VoidCallback onPressed, {bool styled = false}) {
    if (styled) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF2A068F),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      );
    }
  }

  static Widget buildBoxOneItem() {
    return Container(
      width: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}


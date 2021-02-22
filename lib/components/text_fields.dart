import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  TextFields({
    this.controller,
    this.label,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          //coloca espaço antes do textfield ou não
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

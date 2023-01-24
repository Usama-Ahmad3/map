import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter UserName',
        border: OutlineInputBorder(),
      ),
    );
  }
}

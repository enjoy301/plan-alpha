import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final Function() onTap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
            color: Coloring.blue[40], borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

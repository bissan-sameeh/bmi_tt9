import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigetorBar extends StatefulWidget {
  final String text;
  Function()? function;
  NavigetorBar({super.key, required this.text, required this.function});

  @override
  State<NavigetorBar> createState() => _NavigetorBarState();
}

class _NavigetorBarState extends State<NavigetorBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}

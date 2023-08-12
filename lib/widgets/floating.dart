import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class floating extends StatefulWidget {
  final IconData icon;
  final Function() function;
  const floating({Key? key, required this.icon, required this.function})
      : super(key: key);

  @override
  State<floating> createState() => _floatingState();
}

class _floatingState extends State<floating> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: widget.function,
        child: Icon(
          widget.icon,
        ));
  }
}

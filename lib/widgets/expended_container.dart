import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modal/person.dart';

class ExpendedContainer extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function()? gender;
  final Color color;
  const ExpendedContainer(
      {Key? key,
      required this.text,
      required this.icon,
      required this.gender,
      required this.color})
      : super(key: key);

  @override
  State<ExpendedContainer> createState() => _ExpendedContainerState();
}

///Male=> true
///Female=>false
class _ExpendedContainerState extends State<ExpendedContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.gender,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 60,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(widget.text)
            ],
          ),
        ),
      ),
    );
  }
}

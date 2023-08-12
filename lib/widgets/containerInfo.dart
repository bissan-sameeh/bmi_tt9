import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'floating.dart';

class ContainerInfo extends StatefulWidget {
  final String text;
  late dynamic secText;
  final double sizeFontFirstText;
  final bool? isCenterWidget;
  final double sizeFontSecText;
  double sliderValue;

  final Function(dynamic newValue) onChangedValue;

  ContainerInfo(
      {Key? key,
      required this.text,
      required this.sliderValue,
      required this.secText,
      required this.sizeFontFirstText,
      this.isCenterWidget = false,
      required this.sizeFontSecText,
      required this.onChangedValue})
      : super(key: key);

  @override
  State<ContainerInfo> createState() => _ContainerInfoState();
}

class _ContainerInfoState extends State<ContainerInfo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(fontSize: widget.sizeFontFirstText),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    " ${widget.secText.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.sizeFontSecText),
                  ),
                  widget.isCenterWidget == true
                      ? const Text(
                          "cm",
                          style: TextStyle(),
                        )
                      : const SizedBox.shrink()
                ],
              ),
              widget.isCenterWidget == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        floating(
                          icon: Icons.add,
                          function: () {
                            setState(() {
                              (widget.secText++);
                              widget.onChangedValue(widget.secText);
                            });
                          },
                        ),
                        floating(
                          icon: Icons.remove,
                          function: () {
                            setState(() {
                              (widget.secText = --widget.secText);
                              widget.onChangedValue(widget
                                  .secText); //notify the parent (Input Page) the update of value
                            });
                          },
                        ),
                      ],
                    )
                  : Slider(
                      min: 0,
                      max: 250,
                      value: widget.sliderValue,
                      activeColor: Colors.pinkAccent,
                      onChanged: (value) {
                        setState(() {
                          widget.sliderValue = value;
                          widget.secText =
                              widget.sliderValue.toDouble(); // Convert to int
                          widget.onChangedValue(widget.secText);
                        });
                      }),
            ],
          )),
    );
  }
}

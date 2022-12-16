import 'package:flutter/material.dart';

class EvoTextField extends StatelessWidget {
  final textController;
  final hintText;
   EvoTextField({super.key,this.textController,this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
                // change this textbox
                decoration:  InputDecoration(
                  hintText: hintText,
                  contentPadding: EdgeInsets.all(20.0),
                  hintStyle: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 118, 116, 118)),
            
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 107, 1))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 107, 1), width: 3)),
                  focusColor: Color.fromARGB(98, 255, 255, 255),
                ),
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: textController,
              );
  }
}
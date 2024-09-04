// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReuseableContainer {
  static Container getContainer(context, screen, text, {border = true}) {
    return Container(
        //padding: const EdgeInsets.all(20),
        width: screen.width / 3,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            color: Colors.grey,
            border: border
                ? Border.all(width: 2.0, color: Colors.blueAccent)
                : const Border(
                    top: BorderSide(width: 2, color: Colors.blueAccent),
                    bottom: BorderSide(width: 2, color: Colors.blueAccent)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(1.0, 3.0), blurRadius: 2)
            ]),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:todo/button.dart';

class DialogBoxPage extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;

  DialogBoxPage({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonPage(
                    text: "Save",
                    onPressed:onSave
                ),
                 const SizedBox( width: 8,),
                ButtonPage(
                    text: "Cancle",
                    onPressed:onCancle
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

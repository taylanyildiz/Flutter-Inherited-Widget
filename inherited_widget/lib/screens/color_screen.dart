import 'package:flutter/material.dart';
import 'package:inherited_widget/widgets/inherited_widget.dart';

class ColorScreen extends StatelessWidget {
  Widget buildColorButton(BuildContext context, Color color) => Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color, elevation: 0),
          onPressed: () {
            final provider = StateInheritedWidget.of(context);
            provider.setColor(color);
            Navigator.pop(context);
          },
          child: Container(height: 100.0),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildColorButton(context, Colors.green),
            buildColorButton(context, Colors.orange),
            buildColorButton(context, Colors.red),
            buildColorButton(context, Colors.blue),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget child;
  final String title;

  CardComponent({@required this.child, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

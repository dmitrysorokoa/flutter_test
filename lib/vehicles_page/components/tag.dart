import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color: Color.fromARGB(255, 215, 200, 200),
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
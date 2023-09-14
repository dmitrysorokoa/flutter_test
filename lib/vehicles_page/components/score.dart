import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score(
    this.value, {
    super.key,
  });

  final int value;

  Widget getTextWidgets(int scoreValue) {
    List<Widget> list = List.generate(
        5,
        (i) => scoreValue >= i + 1
            ? Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Color.fromARGB(255, 17, 162, 19),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                margin: const EdgeInsets.only(right: 2),
              )
            : Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Color.fromARGB(255, 162, 158, 158),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                margin: const EdgeInsets.only(right: 2),
              ));

    return Row(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return getTextWidgets(value);
  }
}

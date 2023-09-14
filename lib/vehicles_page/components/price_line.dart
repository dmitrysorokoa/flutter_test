import 'package:flutter/material.dart';

import 'score.dart';

class PriceLine extends StatelessWidget {
  const PriceLine({
    super.key,
    required this.score,
    required this.price,
  });

  final int score;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Score(score),
              const SizedBox(height: 5),
              const Text('Good price',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(width: 10),
          const Icon(Icons.info_outline, color: Colors.grey)
        ],
      ),
      Text(
        price,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      )
    ]);
  }
}

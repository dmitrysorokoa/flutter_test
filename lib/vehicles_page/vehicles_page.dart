import 'package:flutter/material.dart';

import 'components/card.dart';
import '../models/vehicle_model.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  final List<VehicleModel> vehicles = [
    VehicleModel(
      images: [
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2022/5/27/052722F-73D7-4218-B11AD67276A9F19C.jpg',
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2014/3/20/Bernina-mountains-032014992E25994D.jpg',
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2014/2/16/Beautiful-Sunset--Lake-Macquarie-0216149F32B67E18.jpg',
      ],
      title: 'Audi A4 Avant',
      tags: ['ABRA-VW', '934534534543', 'Car Limousine'],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      score: 3,
      price: '\$29,890',
      status: 'In stock',
    ),
    VehicleModel(
      images: [
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2022/5/27/052722F-73D7-4218-B11AD67276A9F19C.jpg',
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2014/3/20/Bernina-mountains-032014992E25994D.jpg',
        'https://d2rdb56lmj4es2.cloudfront.net/data/photo/2014/2/16/Beautiful-Sunset--Lake-Macquarie-0216149F32B67E18.jpg',
      ],
      title: 'Audi A4 Avant',
      tags: ['ABRA-VW', '934534534543', 'Car Limousine'],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      score: 3,
      price: '\$29,890',
      status: 'In stock',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: ListView(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Vehicles",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            Icon(Icons.search)
          ],
        ),
        Text("${vehicles.length} in total",
            style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
        for (var item in vehicles) VehicleCard(item: item),
      ]),
    ));
  }
}


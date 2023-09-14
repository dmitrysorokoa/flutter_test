import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/models/vehicle_model.dart';

import 'image.dart';
import 'tag.dart';
import 'price_line.dart';

class VehicleCard extends StatefulWidget {
  const VehicleCard({
    super.key,
    required this.item,
  });

  final VehicleModel item;

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  int currentImageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (value, _) => {
                      setState(() {
                        currentImageIndex = value + 1;
                      })
                    }
                  ),
                  items: [
                    for (var image in widget.item.images)
                      VehicleImage(image),
                  ]),
              Positioned(
                left: 20.0,
                top: 20.0,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.item.status)),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Colors.grey,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text("$currentImageIndex / ${widget.item.images.length}", style: const TextStyle(color: Colors.white)),
                      ],
                    )),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.item.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Wrap(
                runSpacing: 10.0,
                children: [
                  for (var tag in widget.item.tags) Tag(tag),
                ],
              ),
              const SizedBox(height: 10),
              Text(widget.item.description),
              const Divider(
                height: 20,
                thickness: 2,
                color: Colors.grey,
              ),
              PriceLine(score: widget.item.score, price: widget.item.price ),
            ]),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Components/Cards.dart';

class HomeScreen extends StatelessWidget {
  final List images = [
    {"id": 1, "url": "images/Card.png"},
    {"id": 2, "url": "images/Card.png"},
    {"id": 3, "url": "images/Card.png"},
    {"id": 4, "url": "images/Card.png"},
    {"id": 5, "url": "images/Card.png"},
    {"id": 6, "url": "images/Card.png"},
  ];

  final CarouselController carouselController = CarouselController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 8.0, right: 15.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi Buddy👋",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "Create your own style",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  labelText: 'Search Products',
                  suffixIcon: const Icon(Icons.camera_alt_outlined),
                ),
              ),
              Stack(
                children: [
                  InkWell(
                    child: CarouselSlider(
                      items: images
                          .map((e) => Image.asset(
                                e['url'],
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                      ),
                    ),
                  )
                ],
              ),
              const Center(
                child: Text(
                  "New Arrivals",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Cards(
                      imagePath: "images/Image (1).png",
                      title: "Polka Dot Shirt",
                      size: "Oversize",
                      price: "\$74.00",
                    ),
                  ),
                  Expanded(
                    child: Cards(
                      imagePath: "images/Image.png",
                      title: "Blazer Jacket",
                      size: "Slim Fit",
                      price: "\$125.00",
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Cards(
                      imagePath: "images/Product 5.png",
                      title: "Pleated skirt",
                      size: "Tight Pleated",
                      price: "\$38.00",
                    ),
                  ),
                  Expanded(
                    child: Cards(
                      imagePath: "images/Product 6.png",
                      title: "Cool Skirt",
                      size: "Jeans",
                      price: "\$42.00",
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Cards(
                      imagePath: "images/Product 3.png",
                      title: "Pencil Skirt",
                      size: "Jeans",
                      price: "\$32.90",
                    ),
                  ),
                  Expanded(
                    child: Cards(
                      imagePath: "images/Product 4.png",
                      title: "Cool Skirt",
                      size: "Jeans",
                      price: "\$53.50",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

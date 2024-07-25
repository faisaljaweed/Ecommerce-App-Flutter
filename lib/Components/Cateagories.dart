import 'package:flutter/material.dart';

class Cateagories extends StatefulWidget {
  const Cateagories({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CateagoriesState createState() => _CateagoriesState();
}

class _CateagoriesState extends State<Cateagories> {
  List<Map<String, dynamic>> images = [
    {
      "id": 1,
      "url": "images/Category/Categories 1.png",
      "heading": "Dresses",
      "para": "140 Products"
    },
    {
      "id": 2,
      "url": "images/Category/Categories 2.png",
      "heading": "Coats & Outwear",
      "para": "54 Products"
    },
    {
      "id": 3,
      "url": "images/Category/Categories 3.png",
      "heading": "Bikini & Beachwear",
      "para": "37 Products"
    },
    {
      "id": 4,
      "url": "images/Category/Categories 4.png",
      "heading": "Tops & T-shirts",
      "para": "260 Products"
    },
    {
      "id": 5,
      "url": "images/Category/Categories 5.png",
      "heading": "Hats",
      "para": "65 Products"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: images
            .map((e) => Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e['url'],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        e['heading'],
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        e['para'],
                        style:
                            const TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

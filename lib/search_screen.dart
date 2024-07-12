import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, dynamic>> images = [
    {
      "id": 1,
      "url": "images/categories1.png",
      "heading": "Dresses",
      "para": "140 Products"
    },
    {
      "id": 2,
      "url": "images/categories2.png",
      "heading": "Coats & Outwear",
      "para": "54 Products"
    },
    {
      "id": 3,
      "url": "images/categories3.png",
      "heading": "Bikini & Beachwear",
      "para": "37 Products"
    },
    {
      "id": 4,
      "url": "images/categories4.png",
      "heading": "Tops & T-shirts",
      "para": "260 Products"
    },
    {
      "id": 5,
      "url": "images/categories5.png",
      "heading": "Hats",
      "para": "65 Products"
    },
  ];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Dresses",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Hats",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: images.map((e) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: Image.asset(
                            e['url'],
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Changed to spaceBetween
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['heading'],
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                Text(
                                  e['para'],
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

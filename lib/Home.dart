// ignore_for_file: avoid_print

import 'package:ecommerce/Components/Cards.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    {"id": 1, "url": "images/Card.png"},
    {"id": 2, "url": "images/Card.png"},
    {"id": 3, "url": "images/Card.png"},
    {"id": 4, "url": "images/Card.png"},
    {"id": 5, "url": "images/Card.png"},
    {"id": 6, "url": "images/Card.png"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Home')),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Support'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Contact'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hi Buddy👋"),
                const Text("Create your own style"),
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
                      onTap: () {
                        print(currentIndex);
                      },
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
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              })),
                    )
                  ],
                ),
                const Text("Nnew Arrivals"),
                Scrollbar(
                    child: SingleChildScrollView(
                        child: Container(
                  height: 320,
                  child: const Cards(),
                )))
              ],
            ),
          )),
    );
  }
}

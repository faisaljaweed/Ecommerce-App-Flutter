import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Product_card.dart'; // Import the correct file for ProductCard

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> images = [
    {"id": "1", "url": "images/Card.png"},
    {"id": "2", "url": "images/Card.png"},
    {"id": "3", "url": "images/Card.png"},
    {"id": "4", "url": "images/Card.png"},
    {"id": "5", "url": "images/Card.png"},
    {"id": "6", "url": "images/Card.png"},
  ];

  final CarouselController carouselController = CarouselController();

  String searchQuery = '';

  final List<Map<String, String>> products = [
    {
      "imagePath": "images/Image (1).png",
      "title": "Polka Dot Shirt",
      "size": "Oversize",
      "price": "\$74.00"
    },
    {
      "imagePath": "images/Image.png",
      "title": "Blazer Jacket",
      "size": "Slim Fit",
      "price": "\$125.00"
    },
    {
      "imagePath": "images/Product 5.png",
      "title": "Pleated skirt",
      "size": "Tight Pleated",
      "price": "\$38.00"
    },
    {
      "imagePath": "images/Product 6.png",
      "title": "Cool Skirt",
      "size": "Jeans",
      "price": "\$42.00"
    },
    {
      "imagePath": "images/Product 3.png",
      "title": "Pencil Skirt",
      "size": "Jeans",
      "price": "\$32.90"
    },
    {
      "imagePath": "images/Product 4.png",
      "title": "Cool Skirt",
      "size": "Jeans",
      "price": "\$53.50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((product) =>
            product['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                letterSpacing: 1.5),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(
                Icons.menu,
                size: 30,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.white,
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
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
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
                                  e['url']!,
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
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width - 30 - 15) /
                            (2 * 350),
                    mainAxisSpacing: 45,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (_, i) {
                    if (i % 2 == 0) {
                      return ProductCard(product: filteredProducts[i]);
                    }
                    return OverflowBox(
                      maxHeight: 350.0 + 70.0,
                      child: Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: ProductCard(product: filteredProducts[i]),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/heart_screen.dart';
import 'package:ecommerce/search_screen.dart';
import 'package:ecommerce/thanks.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Product_card.dart'; // Import the correct file for ProductCard

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      "id": "1",
      "imagePath": "images/Image (1).png",
      "title": "Polka Dot Shirt",
      "size": "Oversize",
      "price": "\$74.00"
    },
    {
      "id": "2",
      "imagePath": "images/Image.png",
      "title": "Blazer Jacket",
      "size": "Slim Fit",
      "price": "\$125.00"
    },
    {
      "id": "3",
      "imagePath": "images/Product 5.png",
      "title": "Pleated skirt",
      "size": "Tight Pleated",
      "price": "\$38.00"
    },
    {
      "id": "4",
      "imagePath": "images/Product 6.png",
      "title": "Cool Skirt",
      "size": "Jeans",
      "price": "\$42.00"
    },
    {
      "id": "5",
      "imagePath": "images/Product 3.png",
      "title": "Pencil Skirt",
      "size": "Jeans",
      "price": "\$32.90"
    },
    {
      "id": "6",
      "imagePath": "images/Product 4.png",
      "title": "Cool Skirt",
      "size": "Jeans",
      "price": "\$53.50"
    },
  ];
  Color textColor = Colors.black;

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where(
          (product) => product['title']!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xfffdfdfd),
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
                color: Color(0xff4b03ce),
              ),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 3,
                  fontFamily: 'Pacifico',
                ),
              ),
              onTap: () {
                setState(() {
                  textColor = const Color(0xff4b03ce);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen())); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category,
                size: 35,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 3,
                  fontFamily: 'Pacifico',
                ),
              ),
              onTap: () {
                setState(() {
                  textColor = const Color(0xff4b03ce);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SearchScreen())); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.support_agent,
                size: 35,
              ),
              title: Text(
                'Support',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 3,
                  fontFamily: 'Pacifico',
                ),
              ),
              onTap: () {
                setState(() {
                  textColor = const Color(0xff4b03ce);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Thanks())); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_page,
                size: 35,
              ),
              title: Text(
                'Contact',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 3,
                  fontFamily: 'Pacifico',
                ),
              ),
              onTap: () {
                setState(() {
                  textColor = const Color(0xff4b03ce);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const HeartScreen())); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
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
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const Text(
                    "Create your own style",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      color: const Color(0xfff5f5f5),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        focusNode: _focusNode,
                        onChanged: (value) {
                          setState(
                            () {
                              searchQuery = value;
                            },
                          );
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 3, color: Color(0xfff5f5f5)),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          labelText: 'Search Products',
                          suffixIcon: const Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      InkWell(
                        child: CarouselSlider(
                          items: images
                              .map(
                                (e) => Image.asset(
                                  e['url']!,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              )
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
                        // fontFamily: 'Pacifico',
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        // shadows: [
                        //   Shadow(
                        //     blurRadius: 2.0,
                        //     color: Colors.black,
                        //     // offset: Offset(5.0, 5.0),
                        //   ),
                        // ]
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
                              (2 * 330),
                      mainAxisSpacing: 45,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (_, i) {
                      Widget productCard = Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Set your desired background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              10), // Optional: adds rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ProductCard(product: filteredProducts[i]),
                        ),
                      );

                      if (i % 2 == 0) {
                        return productCard;
                      }
                      return OverflowBox(
                        maxHeight: 330.0 + 70.0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: productCard,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

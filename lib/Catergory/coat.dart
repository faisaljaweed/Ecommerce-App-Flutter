import 'package:ecommerce/Product_card.dart';
import 'package:flutter/material.dart';

class CoatScreen extends StatefulWidget {
  const CoatScreen({super.key});

  @override
  State<CoatScreen> createState() => _CoatScreenState();
}

class _CoatScreenState extends State<CoatScreen> {
  String searchQuery = '';
  final FocusNode _focusNode = FocusNode();
  bool _showSearchBar = false;

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

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((product) =>
            product['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showSearchBar = false;
            _focusNode.unfocus();
          });
        },
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Text(
                        "Coats & Outwear",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showSearchBar = !_showSearchBar;
                          });
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _showSearchBar,
                    child: TextField(
                      focusNode: _focusNode,
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
                        labelText: 'Search Skirts',
                      ),
                    ),
                  ),
                  const Text("132 Skirts"),
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
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              10), // Optional: adds rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                  SizedBox(
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

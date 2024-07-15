import 'package:ecommerce/home_page.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

  bool _showSearchBar = false;
  String _searchQuery = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredImages = images.where((image) {
      return image['heading']
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _showSearchBar = false;
          });
        },
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text(
                        'Categories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            letterSpacing: 1.5),
                      ),
                      Visibility(
                        visible: !_showSearchBar,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _showSearchBar = !_showSearchBar;
                              FocusScope.of(context).requestFocus(_focusNode);
                            });
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_showSearchBar)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      focusNode: _focusNode,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Categories',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Dresses",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
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
                  children: filteredImages.map((e) {
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_sharp),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

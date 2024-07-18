import 'package:ecommerce/Components/Cards.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  String searchQuery = '';
  final FocusNode _focusNode = FocusNode();
  // bool _showSearchBar = false;

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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final filteredProducts = products
    //     .where((product) =>
    //         product['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
    //     .toList();

    return const Center(
      child: Text('Product Screen'),
    );
    // body: GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       _showSearchBar = false;
    //       _focusNode.unfocus();
    //     });
    //   },
    //   child: Scrollbar(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(15.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const SizedBox(
    //               height: 30,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 IconButton(
    //                     onPressed: () {}, icon: const Icon(Icons.arrow_back)),
    //                 const Text(
    //                   "Skirts",
    //                   style: TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       _showSearchBar = !_showSearchBar;
    //                     });
    //                   },
    //                   icon: const Icon(Icons.search),
    //                 ),
    //               ],
    //             ),
    //             Visibility(
    //               visible: _showSearchBar,
    //               child: TextField(
    //                 focusNode: _focusNode,
    //                 onChanged: (value) {
    //                   setState(() {
    //                     searchQuery = value;
    //                   });
    //                 },
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10.0),
    //                   ),
    //                   prefixIcon: const Icon(Icons.search),
    //                   labelText: 'Search Skirts',
    //                 ),
    //               ),
    //             ),
    //             const Text("132 Skirts"),
    //             for (var i = 0; i < filteredProducts.length; i += 2) ...[
    //               Row(
    //                 children: [
    //                   if (i < filteredProducts.length)
    //                     Expanded(
    //                       child: Cards(
    //                         imagePath: filteredProducts[i]['imagePath']!,
    //                         title: filteredProducts[i]['title']!,
    //                         size: filteredProducts[i]['size']!,
    //                         price: filteredProducts[i]['price']!,
    //                       ),
    //                     ),
    //                   if (i + 1 < filteredProducts.length)
    //                     Expanded(
    //                       child: Cards(
    //                         imagePath: filteredProducts[i + 1]['imagePath']!,
    //                         title: filteredProducts[i + 1]['title']!,
    //                         size: filteredProducts[i + 1]['size']!,
    //                         price: filteredProducts[i + 1]['price']!,
    //                       ),
    //                     ),
    //                 ],
    //               ),
    //             ],
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
    // );
  }
}

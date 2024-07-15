import 'package:ecommerce/bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, String> product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(product['imagePath']!), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['title']!,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product['price']!,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
                RatingBar.builder(
                  unratedColor: const Color.fromARGB(255, 223, 221, 221),
                  itemSize: 28,
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {},
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                    "Long Description of the product hereLong Description of the product here Long Description of the product here Long Description of the product here",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xfff7f8fa),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          CupertinoIcons.cart_fill,
                          size: 32,
                          color: Color(0xfffd725a),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBottomSheet(
                                product: product,
                              );
                            });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 70),
                          decoration: BoxDecoration(
                            color: const Color(0xfffd7251),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.8)),
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

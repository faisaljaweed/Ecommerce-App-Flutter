import 'package:ecommerce/cart_item_samples.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final Map<String, String> product;
  const CartScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                        ),
                      ),
                    ),
                    const Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.more_horiz,
                          size: 30,
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  CartItemSamples(
                    product: product,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

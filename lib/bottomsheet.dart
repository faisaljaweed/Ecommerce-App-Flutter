import 'package:ecommerce/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  List sizes = ['S', 'M', 'L', 'XL'];
  final Map<String, String> product;
  CustomBottomSheet({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Size ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 30,
              ),
              for (int i = 0; i < sizes.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xfff7f8fa),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(sizes[i]),
                )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                "Colors",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: const Color(0xff031c3c),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: const Color(0xff3ba48d),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 30),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 18,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 18,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Payment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(product['price']!,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.withOpacity(0.7)))
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.redAccent,
                  ),
                  child: Text(
                    "Chekout",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Colors.white.withOpacity(0.9)),
                  ))),
        ],
      ),
    );
  }
}

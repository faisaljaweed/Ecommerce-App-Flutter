import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  final Map<String, String> product;
  const CartItemSamples({
    super.key,
    required this.product,
  });

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  int _value = 1;
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  void _increment() {
    setState(() {
      _value++;
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 1) {
        _value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(value: _isChecked, onChanged: _toggleCheckbox),
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(widget.product['imagePath']!,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Best Selling",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.product['price']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffd725a),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: _decrement,
                            child: const Icon(
                              CupertinoIcons.minus,
                              size: 18,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "$_value",
                          style: const TextStyle(
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
                          child: InkWell(
                            onTap: _increment,
                            child: const Icon(
                              CupertinoIcons.plus,
                              size: 18,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Other things add

        const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recommended For You"),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                    width: 150,
                    height: 250,
                    child: Image.asset("images/Product 6.png")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                children: [
                  Container(
                    width: 20,
                    height: 130,
                    color: const Color(0xffEEEEEE),
                  ),
                  Image.asset("images/iconcircle.png")
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                    width: 150,
                    height: 250,
                    child: Image.asset("images/Product 6.png")),
              ],
            ),
          ],
        ),

        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Promocode",
                    style: TextStyle(color: Color(0xff999999), fontSize: 15),
                  ),
                  Text(
                    "Star12",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "\$353.00",
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

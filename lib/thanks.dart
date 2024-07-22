import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/emoji.png"),
          const Text(
            "Thank You",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Text(
            "Your order is now confirmed and on its way. You'll\neceive a shipping confirmation email with tracking\ndetails shortly. In the meantime, feel free to browse our site for more great products.",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

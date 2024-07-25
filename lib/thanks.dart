import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/emoji.png"),
            const SizedBox(
              height: 20,
            ), // Added some space between image and text
            const Text(
              "Thank You",
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Added some space between texts
            const Padding(
              padding: EdgeInsets.only(
                left: 60.0,
                right: 60.0,
              ),
              child: Text(
                "Your order is now confirmed and on its way. You'll receive a shipping confirmation email with tracking details shortly. In the meantime, feel free to browse our site for more great products.",
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontSize: 13.0,
                ),
                textAlign: TextAlign.center, // Center align the text
                maxLines: 4, // Limit the number of lines
                overflow:
                    TextOverflow.ellipsis, // Handle overflow with ellipsis
              ),
            ),
          ],
        ),
      ),
    );
  }
}

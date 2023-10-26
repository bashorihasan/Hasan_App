import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';

class SpecialOfferWidget extends StatelessWidget {
  const SpecialOfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Special Offer",
                style: TextStyle(
                  color: CustomColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset("assets/icons/fire.png", height: 20),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: CustomColor.white,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 1),
                  color: Colors.blueGrey.withOpacity(0.25),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/coffee3.png"),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 2),
                        decoration: BoxDecoration(
                          color: CustomColor.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Limited",
                          style: TextStyle(
                            color: CustomColor.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      const Text(
                        "Buy 1 get 1 free if you buy with Gopay",
                        style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width / 9),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

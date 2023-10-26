import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/coffee_model.dart';

class CoffeeItemWidget extends StatelessWidget {
  const CoffeeItemWidget({
    super.key,
    required this.coffee,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 99,
                  child: Image.asset(coffee.image, fit: BoxFit.fitHeight),
                ),
                const SizedBox(height: 2),
                Text(
                  coffee.name,
                  style: const TextStyle(
                    color: CustomColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  coffee.details,
                  style: const TextStyle(
                    color: CustomColor.black,
                    fontSize: 6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${coffee.price.toInt()} K",
                  style: const TextStyle(
                    color: CustomColor.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 7,
            right: 7,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: CustomColor.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 22,
                color: CustomColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/coffee_model.dart';
import 'package:hasan_app/modules/main_product/screen/main_product_page.dart';

class CoffeeItemWidget extends StatelessWidget {
  const CoffeeItemWidget({
    super.key,
    required this.coffee,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainProductPage(coffee: coffee),
          ),
        );
      },
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: coffee.image,
                    child: Image.asset(
                      coffee.image,
                      height: 99,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
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
            top: 13,
            right: 13,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: CustomColor.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: CustomColor.lightGrey,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${coffee.rate}",
                    style: const TextStyle(
                        color: CustomColor.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
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

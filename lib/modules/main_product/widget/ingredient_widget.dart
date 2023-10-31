import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/main_product/ingredient_model.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
    required this.ingredient,
  });

  final IngredientModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (ingredient.image.isEmpty)
            ? const SizedBox()
            : Image.asset(
                ingredient.image,
                height: 20,
              ),
        const SizedBox(width: 1),
        Text(
          ingredient.name,
          style: const TextStyle(
            color: CustomColor.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hasan_app/common/snackbar_popup.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/coffee_model.dart';
import 'package:hasan_app/modules/main_product/ingredient_model.dart';
import 'package:hasan_app/modules/main_product/main_product_bloc.dart';
import 'package:hasan_app/modules/main_product/widget/coffee_size_widget.dart';
import 'package:hasan_app/modules/main_product/widget/ingredient_widget.dart';

class MainProductPage extends StatelessWidget {
  const MainProductPage({super.key, required this.coffee});

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    final bloc = MainProductBloc();
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: coffee.image,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: height / 2.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    coffee.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.fromLTRB(11, 10, 14.94, 9.61),
                      decoration: const BoxDecoration(
                        color: CustomColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: CustomColor.primary,
                        size: 32,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 9, 20, 50),
                    color: CustomColor.black.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              coffee.name,
                              style: const TextStyle(
                                color: CustomColor.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              coffee.details,
                              style: const TextStyle(
                                color: CustomColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: CustomColor.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 24,
                                color: CustomColor.white,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                "${coffee.rate}",
                                style: const TextStyle(
                                  color: CustomColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.fromLTRB(20, 21, 20, 43),
          height: height / 1.72,
          decoration: const BoxDecoration(
            color: CustomColor.lightGrey,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.grey,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: StreamBuilder<List<IngredientModel>>(
                  stream: bloc.listIngredient.stream,
                  initialData: bloc.listIngredient.value,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) {
                      return const SizedBox();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IngredientWidget(ingredient: data[0]),
                        Container(
                          height: 27,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: CustomColor.black,
                              ),
                            ),
                          ),
                        ),
                        IngredientWidget(ingredient: data[1]),
                        Container(
                          height: 27,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: CustomColor.black,
                              ),
                            ),
                          ),
                        ),
                        IngredientWidget(ingredient: data[2]),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              CoffeeSizeWidget(bloc: bloc),
              const SizedBox(height: 33),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: TextStyle(
                    color: CustomColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
                style: TextStyle(
                  color: CustomColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  snackbarPopup(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 52,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColor.primary,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: CustomColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 58),
                      Container(
                        height: 24,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: CustomColor.lightGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      const Text(
                        "50 k",
                        style: TextStyle(
                          color: CustomColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

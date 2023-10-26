import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/category.dart';
import 'package:hasan_app/modules/home/coffee.dart';
import 'package:hasan_app/modules/home/home_bloc.dart';
import 'package:hasan_app/modules/home/widget/category_item.dart';
import 'package:hasan_app/modules/home/widget/coffee_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            "Categories",
            style: TextStyle(
              color: CustomColor.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 30,
          child: StreamBuilder<List<CoffeeCategory>>(
            stream: bloc.listCategories.stream,
            initialData: bloc.listCategories.value,
            builder: (context, snapCategory) {
              final category = snapCategory.data;
              if (category == null) {
                return const SizedBox();
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CategoryItem(
                    bloc: bloc,
                    category: category[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: category.length,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 165,
          child: StreamBuilder<List<Coffee>>(
            stream: bloc.listCoffee.stream,
            initialData: bloc.listCoffee.value,
            builder: (context, snapCoffee) {
              final coffee = snapCoffee.data;
              if (coffee == null) {
                return const Text("Produk Kosong");
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CoffeeItem(coffee: coffee[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 17),
                itemCount: coffee.length,
              );
            },
          ),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

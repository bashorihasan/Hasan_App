import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/category_model.dart';
import 'package:hasan_app/modules/home/home_bloc.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.bloc,
    required this.category,
  }) : super(key: key);

  final HomeBloc bloc;
  final CoffeeCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CoffeeCategoryModel?>(
      stream: bloc.selectedCategory.stream,
      initialData: bloc.selectedCategory.value,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          bloc.selectedCategory.add(bloc.listCategories.value.first);
        }
        final isSelected = data?.name == category.name;
        return InkWell(
          onTap: () {
            bloc.selectedCategory.add(category);
          },
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: isSelected ? CustomColor.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(33),
            ),
            child: Row(
              children: [
                Image.asset(isSelected
                    ? "${category.icon}_light.png"
                    : "${category.icon}_dark.png"),
                const SizedBox(width: 4),
                Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected ? CustomColor.white : CustomColor.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

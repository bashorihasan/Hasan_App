import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/main_product/main_product_bloc.dart';

class CoffeeSizeItemWidget extends StatelessWidget {
  const CoffeeSizeItemWidget({
    super.key,
    required this.bloc,
    required this.name,
  });

  final MainProductBloc bloc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: bloc.selectedSize.stream,
      initialData: bloc.selectedSize.value,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          bloc.selectedSize.add("Small");
        }
        final isSelected = name == data;
        return InkWell(
          onTap: () => bloc.selectedSize.add(name),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            decoration: BoxDecoration(
              color: (isSelected) ? CustomColor.primary : CustomColor.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 0),
                  color: CustomColor.black.withOpacity(0.08),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: (isSelected) ? CustomColor.white : Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

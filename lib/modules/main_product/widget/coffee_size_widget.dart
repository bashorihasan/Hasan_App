import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/main_product/main_product_bloc.dart';
import 'package:hasan_app/modules/main_product/widget/coffee_size_item_widget.dart';

class CoffeeSizeWidget extends StatelessWidget {
  const CoffeeSizeWidget({
    super.key,
    required this.bloc,
  });

  final MainProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Coffee Size",
            style: TextStyle(
              color: CustomColor.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        StreamBuilder<List<String>>(
          stream: bloc.listSize.stream,
          initialData: bloc.listSize.value,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return const SizedBox();
            }
            return SizedBox(
              height: 37,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CoffeeSizeItemWidget(
                  bloc: bloc,
                  name: data[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 21),
                itemCount: data.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SizedBox(
        height: 50,
        child: TextField(
          style: const TextStyle(
            color: CustomColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            fillColor: CustomColor.lightGrey,
            filled: true,
            hintText: "Search Coffee..",
            hintStyle: const TextStyle(
              color: CustomColor.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 60),
            prefixIcon: const Icon(
              AkarIcons.search,
              color: Color(0xffA6A6AA),
              size: 28,
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 60),
            suffixIcon: Image.asset(
              "assets/icons/menu.png",
              height: 22,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 82;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

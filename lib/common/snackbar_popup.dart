import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';

void snackbarPopup(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBarData);
}

final snackBarData = SnackBar(
  duration: const Duration(milliseconds: 2600),
  backgroundColor: Colors.transparent,
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  content: Container(
    margin: const EdgeInsets.only(bottom: 5),
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Coffee Successfully Added To Cart',
            style: TextStyle(
              color: CustomColor.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 12),
        Icon(
          Icons.check,
          color: Colors.white,
          size: 20.0,
        )
      ],
    ),
  ),
);

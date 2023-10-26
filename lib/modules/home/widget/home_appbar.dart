import 'package:flutter/material.dart';
import 'package:hasan_app/config/colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              Image.asset(
                "assets/images/avatar.png",
                height: 60,
              ),
              SizedBox(width: width / 6),
              Image.asset(
                "assets/icons/location.png",
                height: 20,
              ),
              const SizedBox(width: 2),
              const Text(
                "Bintara, Bekasi",
                style: TextStyle(
                  color: CustomColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/icons/notification.png",
                height: 24,
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            "Good Morning, Dityo",
            style: TextStyle(
              color: CustomColor.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

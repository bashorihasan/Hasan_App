import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hasan_app/modules/on_boarding/corousel_item_model.dart';
import 'package:hasan_app/config/colors.dart';

class OnBoardingCorouselWidget extends StatelessWidget {
  const OnBoardingCorouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItem = List<CorouselItem>.generate(
      3,
      (index) => CorouselItem(image: 'assets/images/onboarding.png'),
    );
    return _Corosel(
      items: listItem,
    );
  }
}

class _Corosel extends StatefulWidget {
  const _Corosel({
    Key? key,
    required this.items,
  })  : itemLength = items.length,
        super(key: key);

  final List<CorouselItem> items;
  final int itemLength;

  @override
  State<_Corosel> createState() => _CoroselState();
}

class _CoroselState extends State<_Corosel> {
  Timer? timer;
  List<String> images = [];
  final PageController _controller = PageController(
    initialPage: 1,
  );

  int page = 1;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 8; i++) {
      widget.items.map((e) => images.add(e.image)).toList();
    }

    timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        if (_controller.hasClients) {
          page++;
          if (page == images.length) {
            page = 0;
            _controller.animateToPage(
              page,
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeInOut,
            );
          } else {
            _controller.animateToPage(
              page,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PageView.builder(
          physics: const ScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          controller: _controller,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: CustomColor.black.withOpacity(0.25),
              ),
            );
          },
          itemCount: images.length,
        ),
        _Indicator(index: page % images.length, length: images.length),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key? key,
    required this.index,
    required this.length,
  }) : super(key: key);

  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    final long = length / 8;
    return Positioned.fill(
      bottom: 170,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 6,
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return AnimatedContainer(
                width: i == (index % long) ? 27 : 6,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(i == (index % long) ? 0 : 5),
                  color: i == (index % long)
                      ? CustomColor.primary
                      : CustomColor.fadedGrey,
                ),
                duration: const Duration(milliseconds: 800),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 6);
            },
            itemCount: long.toInt(),
          ),
        ),
      ),
    );
  }
}

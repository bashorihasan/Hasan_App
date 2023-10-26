import 'package:flutter/material.dart';
import 'package:hasan_app/modules/home/home_bloc.dart';
import 'package:hasan_app/modules/home/navigation_bar_model.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    super.key,
    required this.navBarItem,
    required this.index,
    required this.bloc,
  });

  final HomeBloc bloc;
  final List<NavigationBarModel> navBarItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NavigationBarModel?>(
        stream: bloc.selectedNavigation.stream,
        initialData: bloc.selectedNavigation.value,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            bloc.selectedNavigation.add(navBarItem[0]);
          }
          final isSelected = data == navBarItem[index];
          return Tab(
            icon: Image.asset(
              isSelected
                  ? "${navBarItem[index].image}_dark.png"
                  : "${navBarItem[index].image}_light.png",
              height: 24,
            ),
            text: navBarItem[index].title,
          );
        });
  }
}

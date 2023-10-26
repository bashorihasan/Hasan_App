import 'package:flutter/material.dart';

import 'package:hasan_app/config/colors.dart';
import 'package:hasan_app/modules/home/home_bloc.dart';
import 'package:hasan_app/modules/home/navigation_bar_item.dart';
import 'package:hasan_app/modules/home/widget/categories.dart';
import 'package:hasan_app/modules/home/widget/home_appbar.dart';
import 'package:hasan_app/modules/home/widget/searchbar_delegate.dart';
import 'package:hasan_app/modules/home/widget/special_offer.dart';
import 'package:hasan_app/modules/home/widget/tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = HomeBloc();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: Column(
          children: [
            const HomeAppbar(),
            Expanded(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    delegate: SearchBarDelegate(),
                    floating: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Categories(bloc: bloc),
                        const SpecialOffer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 89,
          color: CustomColor.lightGrey,
          child: StreamBuilder<List<NavigationBarItem>>(
            stream: bloc.listNavbar.stream,
            initialData: bloc.listNavbar.value,
            builder: (context, snapNavBar) {
              final navBarItem = snapNavBar.data;
              if (navBarItem == null) {
                return const SizedBox();
              }
              return TabBar(
                labelColor: CustomColor.primary,
                unselectedLabelColor: CustomColor.grey,
                labelStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: CustomColor.primary,
                    width: 4,
                  ),
                  insets: EdgeInsets.fromLTRB(32, 0, 32, 89),
                ),
                indicatorColor: Colors.black87,
                onTap: (value) =>
                    bloc.selectedNavigation.add(navBarItem[value]),
                tabs: [
                  TabItem(bloc: bloc, navBarItem: navBarItem, index: 0),
                  TabItem(bloc: bloc, navBarItem: navBarItem, index: 1),
                  TabItem(bloc: bloc, navBarItem: navBarItem, index: 2),
                  TabItem(bloc: bloc, navBarItem: navBarItem, index: 3),
                ],
                controller: _tabController,
              );
            },
          ),
        ),
      ),
    );
  }
}

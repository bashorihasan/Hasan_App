import 'package:hasan_app/modules/home/category.dart';
import 'package:hasan_app/modules/home/coffee.dart';
import 'package:hasan_app/modules/home/navigation_bar.dart';
import 'package:sstream/sstream.dart';

class HomeBloc {
  HomeBloc();

  final SStream<List<NavigationBarItem>> listNavbar =
      SStream<List<NavigationBarItem>>(
    [
      NavigationBarItem(image: "assets/icons/home", title: "Home"),
      NavigationBarItem(image: "assets/icons/favourite", title: "Favourite"),
      NavigationBarItem(image: "assets/icons/cart", title: "Cart"),
      NavigationBarItem(image: "assets/icons/profile", title: "Profile"),
    ],
  );

  final SStream<NavigationBarItem?> selectedNavigation =
      SStream<NavigationBarItem?>(null);

  final SStream<CoffeeCategory?> selectedCategory =
      SStream<CoffeeCategory?>(null);

  final SStream<List<CoffeeCategory>> listCategories =
      SStream<List<CoffeeCategory>>([
    CoffeeCategory(icon: "assets/icons/coffee1", name: "Cappuccino"),
    CoffeeCategory(icon: "assets/icons/coffee2", name: "Cold Brew"),
    CoffeeCategory(icon: "assets/icons/coffee3", name: "Expresso"),
  ]);

  final SStream<List<Coffee>> listCoffee = SStream<List<Coffee>>(
    [
      Coffee(
        image: "assets/images/coffee1.png",
        name: "Cappuccino",
        details: "With Chocolate",
        price: 50,
        rate: 4.9,
      ),
      Coffee(
        image: "assets/images/coffee2.png",
        name: "Cappuccino",
        details: "With Low Fat Milk ",
        price: 40,
        rate: 4.7,
      ),
    ],
  );
}

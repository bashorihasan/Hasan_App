import 'package:hasan_app/modules/home/category_model.dart';
import 'package:hasan_app/modules/home/coffee_model.dart';
import 'package:hasan_app/modules/home/navigation_bar_model.dart';
import 'package:sstream/sstream.dart';

class HomeBloc {
  HomeBloc();

  final SStream<List<NavigationBarModel>> listNavbar =
      SStream<List<NavigationBarModel>>(
    [
      NavigationBarModel(image: "assets/icons/home", title: "Home"),
      NavigationBarModel(image: "assets/icons/favourite", title: "Favourite"),
      NavigationBarModel(image: "assets/icons/cart", title: "Cart"),
      NavigationBarModel(image: "assets/icons/profile", title: "Profile"),
    ],
  );

  final SStream<NavigationBarModel?> selectedNavigation =
      SStream<NavigationBarModel?>(null);

  final SStream<CoffeeCategoryModel?> selectedCategory =
      SStream<CoffeeCategoryModel?>(null);

  final SStream<List<CoffeeCategoryModel>> listCategories =
      SStream<List<CoffeeCategoryModel>>([
    CoffeeCategoryModel(icon: "assets/icons/coffee1", name: "Cappuccino"),
    CoffeeCategoryModel(icon: "assets/icons/coffee2", name: "Cold Brew"),
    CoffeeCategoryModel(icon: "assets/icons/coffee3", name: "Expresso"),
  ]);

  final SStream<List<CoffeeModel>> listCoffee = SStream<List<CoffeeModel>>(
    [
      CoffeeModel(
        image: "assets/images/coffee1.png",
        name: "Cappuccino",
        details: "With Chocolate",
        price: 50,
        rate: 4.9,
      ),
      CoffeeModel(
        image: "assets/images/coffee2.png",
        name: "Cappuccino",
        details: "With Low Fat Milk ",
        price: 40,
        rate: 4.7,
      ),
    ],
  );
}

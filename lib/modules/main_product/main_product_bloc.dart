import 'package:hasan_app/modules/main_product/ingredient_model.dart';
import 'package:sstream/sstream.dart';

class MainProductBloc {
  MainProductBloc();

  final SStream<List<IngredientModel>> listIngredient =
      SStream<List<IngredientModel>>([
    IngredientModel(image: "assets/icons/coffee_beans.png", name: "Coffee"),
    IngredientModel(image: "assets/icons/chocolate_bar.png", name: "Chocolate"),
    IngredientModel(image: "", name: "Medium Roasted"),
  ]);

  final SStream<List<String>> listSize = SStream<List<String>>(
    ["Small", "Medium", "Large"],
  );

  final SStream<String?> selectedSize = SStream<String?>(null);
}

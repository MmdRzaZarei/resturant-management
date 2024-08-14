import 'drink.dart';
import 'food.dart';

class Menu {
  List<Food> foods = [];
  List<Drink> drinks = [];

  void addFood({
    required String name,
    required String description,
    required int price,
  }) {
    Food food = new Food(name: name, description: description, price: price);
    foods.add(food);
  }

  void addDrink(
      {required int amount,
      required String name,
      required String description,
      required int price}) {
    Drink drink = new Drink(
        amount: amount, name: name, description: description, price: price);
    drinks.add(drink);
  }

  void removeFood({required String name}) {
    Food food = foods.firstWhere((element) => element.name == name);
    foods.remove(food);
  }

  void removeDrink({required String name}) {
    int drinkIndex = drinks.indexWhere((drink) => drink.name == name);
    drinks.removeAt(drinkIndex);
  }

  void removeACertainNumberOFDrink(
      {required String name, required int deleteCount}) {
    Drink drink = drinks.firstWhere((drink) => drink.name == name);
    drink.amount -= deleteCount;
  }

  void addACertainNumberOFDrink({required String name, required int addCount}) {
    Drink drink = drinks.firstWhere((drink) => drink.name == name);
    drink.amount -= addCount;
  }

  @override
  String toString() {
    return 'Menu{foods: $foods, drinks: $drinks}';
  }
}

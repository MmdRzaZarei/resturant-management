import 'Drink.dart';
import 'Food.dart';
import 'Menu.dart';

class Order {
  List<Food> orderedFoods = [];
  List<Drink> orderedDrinks = [];
//------------------------------------------------------------------------------
  void addFoodToOrder({required String foodName, required int number}) {
    Menu menu = new Menu();
    for (int i = 0; i < number; i++) {
      orderedFoods
          .add(menu.foods.firstWhere((food) => food.name == foodName) as Food);
    }
  }

  void addDrinkToOrder(
      {required String drinkName, required int numberOfDrinks}) {
    Menu menu = new Menu();
    for (int i = 0; i < numberOfDrinks; i++) {
      orderedDrinks.add(
          menu.foods.firstWhere((drink) => drink.name == drinkName) as Drink);
    }
    menu.removeACertainNumberOFDrink(
        name: drinkName, deleteCount: numberOfDrinks);
  }

  void removeFoodFromOrder(
      {required String foodName, required int deleteNumber}) {
    for (int i = 0; i < deleteNumber; i++) {
      orderedFoods.removeWhere((food) => foodName == food.name);
    }
  }

  void removeDrinkFromOrder(
      {required String drinkName, required int deleteNumber}) {
    for (int i = 0; i < deleteNumber; i++) {
      orderedDrinks.removeWhere((drink) => drinkName == drink.name);
    }
    Menu menu = new Menu();
    menu.addACertainNumberOFDrink(name: drinkName, addCount: deleteNumber)
  }

  int calculateTotalCost() {
    int sum = 0;
    for (Food food in orderedFoods) {
      sum += food.price;
    }
    for (Drink drink in orderedDrinks) {
      sum += drink.price;
    }
    return sum;
  }
}

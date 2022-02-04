// Controlling our shopping card
// Must be active for all application

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';

class ShoppingCardService extends GetxService {
  final _shoppingCard = <int, ShoppingCardModel>{}.obs;

  // List includes all products add to card, divided by category
  List<ShoppingCardModel> get products => _shoppingCard.values.toList();

  // Quantity of products (Total)
  int get totalProducts => _shoppingCard.values.length;

  // Select an item of card by its id
  ShoppingCardModel? getById(int id) => _shoppingCard[id];

  // Calculating totalValue on shoppingCard
  double get totalValue {
    return _shoppingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue +=
          shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  // Add / Remove product in Shopping Card
  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCardModel(quantity: quantity, product: product);
      });
    }
  }

  // Remove all items from Shopping Card (Method from GetX)
  void clear() => _shoppingCard.clear();
}

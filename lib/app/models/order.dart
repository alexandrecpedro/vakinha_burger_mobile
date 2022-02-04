import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';

class Order {
  // Data to create an order on backend
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> items;

  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });

}

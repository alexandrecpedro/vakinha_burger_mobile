import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/order.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_controller.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/order_repository.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderRepository _orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  // CONSTRUCTOR
  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRepository = orderRepository;

  // GETTERS
  // Product List
  List<ShoppingCardModel> get products => _shoppingCardService.products;
  // Total Value on shopping card
  double get totalValue => _shoppingCardService.totalValue;

  // SETTERS
  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  // METHODS
  // Add quantity for an existing item on Shopping Card
  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  // Subtract quantity for an existing item on Shopping Card
  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  // Remove all items from Shopping Card
  void clear() => _shoppingCardService.clear();

  // Create an order
  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );
    var orderPix = await _orderRepository.createOrder(order);
    // Adding totalValue to orderPix (overwriting)
    orderPix = orderPix.copyWith(totalValue: totalValue);

    clear();

    // Sending orderPix to finished screen
    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}

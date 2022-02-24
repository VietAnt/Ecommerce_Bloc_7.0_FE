//!--Cart--//
// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_smart/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  //*--Bien--//
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  //*_them_so_luong//
  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  //*--Tong tien--//
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  //*--Tien chuyen phat--//
  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  //*--total---//
  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  //*--DK : Chuyen hang--//
  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;

      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  //*--subtotalString--//
  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  //*--Loai bo dnah sach Tinh--//

}

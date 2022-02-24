import 'package:ecommerce_smart/models/category_model.dart';
import 'package:ecommerce_smart/models/models.dart';
import 'package:ecommerce_smart/screens/product/product_screen.dart';
import 'package:ecommerce_smart/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      // ignore: no_duplicate_case_values
      case HomeScreen.routeName:
        return HomeScreen.route();
      //--SplashScreen--//
      case SplashScreen.routeName:
        return SplashScreen.route();
      //--cart--//
      case CartScreen.routeName:
        return CartScreen.route();
      //--product--//
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      //--Wishlist--//
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      //--Catlog--//
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      //Check out
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  //--error--//
  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}

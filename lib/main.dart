import 'package:ecommerce_smart/bloc/category/category_bloc.dart';
import 'package:ecommerce_smart/bloc/check_out/checkout_bloc.dart';
import 'package:ecommerce_smart/bloc/product/product_bloc.dart';
import 'package:ecommerce_smart/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_smart/config/app_router.dart';
import 'package:ecommerce_smart/config/theme.dart';
import 'package:ecommerce_smart/repositories/category/category_repository.dart';
import 'package:ecommerce_smart/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_smart/repositories/product/product_repository.dart';
import 'package:ecommerce_smart/screens/checkout/checkout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_bloc.dart';
import 'screens/screens.dart';
import 'simple_bloc_observer.dart';
import 'widgets/widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

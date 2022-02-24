import 'package:ecommerce_smart/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_smart/models/models.dart';
import 'package:ecommerce_smart/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/favorite';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Favorite'),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WishlistLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.25,
                  ),
                  itemCount: state.wishlist.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: ProductCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishlist: true,
                    ));
                  },
                ),
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ));
  }
}


// class WishlistScreen extends StatelessWidget {
//   //--khai bao router--//
//   static const String routeName = '/favorite';

//   static Route route() {
//     return MaterialPageRoute(
//         settings: const RouteSettings(name: routeName),
//         builder: (_) => WishlistScreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Favorite'),
//       bottomNavigationBar: const CustomNavBar(),
//       body: BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is WishlistLoading) {
//             return const Center(
//               child: const CircularProgressIndicator(),
//             );
//           }
//           if (state is WishlistLoaded) {
//             GridView.builder(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   childAspectRatio: 2.2,
//                 ),
//                 itemCount: state.wishlist.products.length,
//                 // Product.products.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Center(
//                       child: ProductCard(
//                     product: state.wishlist.products[index],
//                     widthFactor: 1.1,
//                     leftPosition: 100,
//                     isWishlist: true,
//                   ));
//                 });
//           } else {
//             return const Text('Something went wrong');
//           }
//         },
//       ),
//     );
//   }
// }
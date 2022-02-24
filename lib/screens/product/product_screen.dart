import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_smart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_smart/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_smart/models/models.dart';
import 'package:ecommerce_smart/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//!--San_Pham_Mua--//
class ProductScreen extends StatelessWidget {
  //--khai bao router--//
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;
  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(WishlistProductAdded(product));

                        final snackBar =
                            SnackBar(content: Text('Add to your favorite'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              //*-TextButton-
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(fontSize: 15),
                      ));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.9,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            initialPage: 2,
            autoPlay: true,
          ),
          items: [HeroCarouselCard(product: product)],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.black.withAlpha(50),
                alignment: Alignment.bottomCenter,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                margin: const EdgeInsets.all(5),
                height: 50,
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //*--Mo ta San Pham--*
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text(
              'Product Information',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: true,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ListTile(
                title: Text(
                    'Figma connects everyone in the design process so teams can deliver better products, faster.'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text(
              'Delivery Information',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: true,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ListTile(
                title: Text(
                    'Figma connects everyone in the design process so teams can deliver better products, faster.'),
              )
            ],
          ),
        ),
      ]),
      // HeroCarouselCard(product: product),
    );
  }
}

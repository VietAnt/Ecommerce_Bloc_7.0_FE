import 'package:ecommerce_smart/models/category_model.dart';
import 'package:ecommerce_smart/models/models.dart';
import 'package:flutter/material.dart';

//!--Hoat Anh Chuyen Dong--Sileder--//
class HeroCarouselCard extends StatelessWidget {
  //*Bien-Category
  final Category? category;
  final Product? product;

  HeroCarouselCard({this.category, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {
          Navigator.pushNamed(context, '/catalog', arguments: category);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    // category.imageUrl,
                    product == null ? category!.imageUrl : product!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      // category.name,
                      product == null ? category!.name : '',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                      // style: const TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 20.0,
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

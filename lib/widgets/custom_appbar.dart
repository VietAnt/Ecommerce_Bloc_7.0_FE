import 'package:flutter/material.dart';

//!----Thanh Ben Tren---AppBar----//
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black87),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
            },
            icon: const Icon(Icons.favorite_border))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

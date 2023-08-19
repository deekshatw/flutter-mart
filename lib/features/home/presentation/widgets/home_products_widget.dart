import 'package:flutter/material.dart';
import 'package:flutter_mart/features/home/bloc/home_bloc.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';

class HomeProductsWidget extends StatelessWidget {
  final ProductModel products;
  final HomeBloc homeBloc;
  const HomeProductsWidget(
      {super.key, required this.products, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeBloc.add(HomeProductClickedEvent());
      },
      child: Container(
        child: Column(
          children: [
            Image.network(products.imageUrl),
            Text(products.name),
            Text(products.price),
            IconButton(
              onPressed: () {
                homeBloc.add(HomeProductWishlistClickedEvent());
              },
              icon: Icon(Icons.favorite_border_rounded),
            ),
            IconButton(
              onPressed: () {
                homeBloc.add(HomeProductCartClickedEvent());
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

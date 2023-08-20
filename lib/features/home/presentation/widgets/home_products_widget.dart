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
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(products.imageUrl)),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          products.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          products.description,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${products.price}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistClickedEvent(products));
                    },
                    icon: Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartClickedEvent(products));
                    },
                    icon: Icon(Icons.shopping_bag_outlined)),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

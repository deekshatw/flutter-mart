import 'package:flutter/material.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';
import 'package:flutter_mart/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistItemsWidget extends StatelessWidget {
  final ProductModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistItemsWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              productDataModel.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              productDataModel.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ]),
          IconButton(
            onPressed: () {
              wishlistBloc
                  .add(WishlistRemovedFromWishlistEvent(productDataModel));
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
          Text(
            "\$${productDataModel.price}",
            style: TextStyle(fontSize: 20, color: Colors.teal),
          )
        ],
      ),
    );
  }
}

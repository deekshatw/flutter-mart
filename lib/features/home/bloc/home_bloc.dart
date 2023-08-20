import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mart/data/cart_items.dart';
import 'package:flutter_mart/data/products.dart';
import 'package:flutter_mart/data/wishlist_items.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeNavigateCartEvent>(homeNavigateCartEvent);

    on<HomeNavigateWishlistEvent>(homeNavigateWishlistEvent);

    on<HomeProductWishlistClickedEvent>(homeProductWishlistClickedEvent);

    on<HomeProductCartClickedEvent>(homeProductCartClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadingSuccessState(
        GroceryData.groceryProducts
            .map(
              (e) => ProductModel(
                e['id'],
                e['name'],
                e['description'],
                e['price'],
                e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeNavigateCartEvent(
      HomeNavigateCartEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeNavigateWishlistEvent(
      HomeNavigateWishlistEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeProductWishlistClickedEvent(
      HomeProductWishlistClickedEvent event, Emitter<HomeState> emit) {
    print('item wishlisted');

    wishlistItems.add(event.clickedProduct);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeProductCartClickedEvent(
      HomeProductCartClickedEvent event, Emitter<HomeState> emit) {
    print('item carted');
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddedToCartActionState());
  }
}

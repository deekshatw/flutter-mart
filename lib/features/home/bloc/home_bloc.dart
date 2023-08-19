import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mart/data/products.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeNavigateCartEvent>(homeNavigateCartEvent);

    on<HomeNavigateWishlistEvent>(homeNavigateWishlistEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadingSuccessState(
        Products.products
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
}

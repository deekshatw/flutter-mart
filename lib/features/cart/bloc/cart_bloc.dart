import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mart/data/cart_items.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemovedFromCartEvent>(cartRemovedFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadingSuccessState(cartItems));
  }

  FutureOr<void> cartRemovedFromCartEvent(
      CartRemovedFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removedProduct);
    emit(CartLoadingSuccessState(cartItems));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mart/data/wishlist_items.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemovedFromWishlistEvent>(wishlistRemovedFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadingSuccessState(wishlistItems));
  }

  FutureOr<void> wishlistRemovedFromWishlistEvent(
      WishlistRemovedFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.removedProduct);
    emit(WishlistLoadingSuccessState(wishlistItems));
  }
}

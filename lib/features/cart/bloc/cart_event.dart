part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemovedFromCartEvent extends CartEvent {
  final ProductModel removedProduct;

  CartRemovedFromCartEvent(this.removedProduct);
}

part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartLoadingSuccessState extends CartState {
  final List<ProductModel> cartItems;

  CartLoadingSuccessState(this.cartItems);
}

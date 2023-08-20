part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductWishlistClickedEvent(this.clickedProduct);
}

class HomeProductCartClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductCartClickedEvent(this.clickedProduct);
}

class HomeProductClickedEvent extends HomeEvent {}

class HomeNavigateWishlistEvent extends HomeEvent {}

class HomeNavigateCartEvent extends HomeEvent {}

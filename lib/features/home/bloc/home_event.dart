part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistClickedEvent extends HomeEvent {}

class HomeProductCartClickedEvent extends HomeEvent {}

class HomeProductClickedEvent extends HomeEvent {}

class HomeNavigateWishlistEvent extends HomeEvent {}

class HomeNavigateCartEvent extends HomeEvent {}

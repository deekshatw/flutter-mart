part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeLoadingSuccessState(this.products);
}

class HomeLoadingErrorState extends HomeState {}

class HomeProductWishlistedActionState extends HomeActionState {}

class HomeProductAddedToCartActionState extends HomeActionState {}

class HomeProductNavigateToProductDetailsActionState extends HomeActionState {}

class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}

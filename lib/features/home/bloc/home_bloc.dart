import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeNavigateCartEvent>(homeNavigateCartEvent);

    on<HomeNavigateWishlistEvent>(homeNavigateWishlistEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
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

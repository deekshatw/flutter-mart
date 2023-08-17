import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mart/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter_mart/features/home/bloc/home_bloc.dart';
import 'package:flutter_mart/features/wishlist/presentation/screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border_rounded),
                onPressed: () {
                  homeBloc.add(HomeNavigateWishlistEvent());
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  homeBloc.add(HomeNavigateCartEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

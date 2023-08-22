import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mart/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_mart/features/wishlist/presentation/widgets/wishlist_items_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingSuccessState:
            final successState = state as WishlistLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Wishlist'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: successState.wishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistItemsWidget(
                          productDataModel: successState.wishlistItems[index],
                          wishlistBloc: wishlistBloc);
                    }),
              ),
            );
          default:
            return const Center(child: Text('No items in your wishlist!'));
        }
      },
    );
  }
}

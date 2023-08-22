import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mart/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_mart/features/cart/presentation/widgets/cart_items_widget.dart';
import 'package:flutter_mart/features/home/bloc/home_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadingSuccessState:
            final successState = state as CartLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Cart'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemsWidget(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc);
                    }),
              ),
            );
          default:
            return const Center(child: Text('No items in your cart!'));
        }
      },
    );
  }
}

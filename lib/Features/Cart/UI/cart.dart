import 'package:bloc_state_management/Features/Cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_tile_widget.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  final CartBloc cartBloc =CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {

          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                          cartBloc: cartBloc,
                          productDataModel: successState.cartItems[index]);
                    });

              default:
            }
            return Container();
          },
        )
    );
  }
}

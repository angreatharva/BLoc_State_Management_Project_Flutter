import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/Cart_Data.dart';
import 'package:meta/meta.dart';

import '../../Home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
  CartInitialEvent event,
  Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItem));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event,
      Emitter<CartState> emit) {
    cartItem.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItem));
  }
}

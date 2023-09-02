import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/Cart_Data.dart';
import 'package:bloc_state_management/data/WishList_Data.dart';
import 'package:meta/meta.dart';

import '../../../data/Grocery_data.dart';
import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListNavigateEvent>(homeProductWishListNavigateEvent);
    on<HomeProductCartNavigateEvent>(homeProductCartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadSuccessState(
        products: Grocery_Data.groceryProducts
            .map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']))
            .toList()));
  }

    FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("WishList Clicked");
    wishlistItem.add(event.clickedProduct);
    emit(HomeProductItemsWishlistedActionState());
  }
  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Clicked");
    cartItem.add(event.clickedProduct);
    emit(HomeProductItemsCartedActionState());

  }

  FutureOr<void> homeProductWishListNavigateEvent(HomeProductWishListNavigateEvent event, Emitter<HomeState> emit) {
    print("WishList Navigate Clicked");
    emit(HomeNavigateToWishListPageActionPage());
  }

  FutureOr<void> homeProductCartNavigateEvent(HomeProductCartNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Clicked");
    emit(HomeNavigateToCartPageActionPage());
  }




}

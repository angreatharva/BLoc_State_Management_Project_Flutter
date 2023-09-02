import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/WishList_Data.dart';
import 'package:meta/meta.dart';
import '../../../data/Cart_Data.dart';
import '../../Home/models/home_product_data_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent,WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
    on<WishlistAddToCartEvent>(wishlistAddToCartEvent);

  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event,
      Emitter<WishlistState> emit) {
    emit(WishlistSuccessState( wishlistItems:wishlistItem ));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(WishlistRemoveFromWishlistEvent event,Emitter<WishlistState> emit) {
    wishlistItem.remove(event.productDataModel);
    emit(WishlistSuccessState( wishlistItems: wishlistItem));
  }

  FutureOr<void> wishlistAddToCartEvent(WishlistAddToCartEvent event, Emitter<WishlistState> emit) {
    print("Item added from wishlist to cart");
    cartItem.add(event.productDataModel);
    emit(WishlistActionState());
  }
}

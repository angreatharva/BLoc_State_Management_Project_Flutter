part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

class WishlistActionState extends WishlistState{}

final class WishlistInitial extends WishlistState {}

class WishlistRemovedActionState extends WishlistState{

}

class WishlistSuccessState extends WishlistState{
final List<ProductDataModel>wishlistItems;

WishlistSuccessState({required this.wishlistItems});
}


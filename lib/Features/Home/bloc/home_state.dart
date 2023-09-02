part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionPage extends HomeActionState {}

class HomeNavigateToCartPageActionPage extends HomeActionState {}

class HomeProductItemsWishlistedActionState extends HomeActionState{}

class HomeProductItemsCartedActionState extends HomeActionState{}

import 'package:bloc_state_management/Features/Cart/UI/cart.dart';
import 'package:bloc_state_management/Features/Home/UI/product_tile_widget.dart';
import 'package:bloc_state_management/Features/Home/bloc/home_bloc.dart';
import 'package:bloc_state_management/Features/WishList/UI/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionPage) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        }
        else if (state is HomeNavigateToWishListPageActionPage) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishListPage()));
        }
        else if(state is HomeProductItemsCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Carted"),duration: Duration(milliseconds: 1000),backgroundColor: Colors.green,));
        }
        else if(state is HomeProductItemsWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Wishlisted"),duration: Duration(milliseconds: 1000),backgroundColor: Colors.blue));
        }

      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;

          case HomeLoadSuccessState:
            final successState = state as HomeLoadSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("Gorcery Here"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishListNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index], homeBloc: homeBloc,
                    );
                  }),
            );
            break;

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
            break;

          default:
            return SizedBox();
        }
      },
    );
  }
}

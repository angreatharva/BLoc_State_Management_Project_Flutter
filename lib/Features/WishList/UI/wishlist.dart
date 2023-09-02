import 'package:bloc_state_management/Features/WishList/UI/wishlist_tile_widget.dart';
import 'package:bloc_state_management/Features/WishList/bloc/wishlist_bloc.dart';
import 'package:bloc_state_management/data/WishList_Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPage();
}

class _WishListPage extends State<WishListPage> {
  final WishlistBloc wishlistBloc =WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your WishList"),
      ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc:wishlistBloc ,
          listener: (context, state) {

          },
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                    itemCount: successState.wishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                        wishlistBloc: wishlistBloc,
                          productDataModel: successState.wishlistItems[index], );
                    });

              default:
            }
            return Container();
          },
        )
    );
  }
}

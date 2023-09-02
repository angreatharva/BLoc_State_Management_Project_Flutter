import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../bloc/home_bloc.dart';
import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key,  required this.productDataModel,  required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(11)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productDataModel.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text(productDataModel.description),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ "+productDataModel.price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeProductWishListButtonClickedEvent(
                                clickedProduct : productDataModel
                            ));
                          },
                          icon: Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeProductCartButtonClickedEvent(
                              clickedProduct: productDataModel
                            ));
                          },
                          icon: Icon(Icons.shopping_cart)),
                    ],
                  ),

                ],
              )
               ],
          )


        ],
      ),
    );
  }
}

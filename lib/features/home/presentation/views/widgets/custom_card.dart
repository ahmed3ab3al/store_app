import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/home/data/models/all_product.dart';

class CustomCard extends StatelessWidget {

 final AllProductModel productModel;
  const CustomCard({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).pushReplacement(AppRouter.update,extra: productModel,);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  blurRadius: 40,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(productModel.title.substring(0,8),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(r'$' '${productModel.price.toString()}'),
                        const Spacer(),
                        Icon(Icons.favorite,
                          color: Colors.red,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 55,
            bottom: 95,
            child: Image.network(productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

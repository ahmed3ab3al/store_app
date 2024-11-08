import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/all_product.dart';
import 'package:store_app/features/home/presentation/view_models/cubit/cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'New Trends',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,size: 30,)),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
        child: FutureBuilder <List<AllProductModel>?>(
            future:StoreCubit.get(context).getAllProduct(),
          builder: (context, snapshot) {
              if(snapshot.hasData){
                List<AllProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return CustomCard(productModel: products[index],);
                    }
                );
              }
              else {
                return const Center(child: CircularProgressIndicator());
              }

            }
           )
      ),
    );
  }
}

import 'package:store_app/core/api/api_helper.dart';
import 'package:store_app/core/api/end_points.dart';
import 'package:store_app/core/errors/exception.dart';
import 'package:store_app/features/home/data/models/all_product.dart';

class GetAllProduct {
  final ApiHelper apiHelper;
  GetAllProduct(this.apiHelper);

  getCategoryProduct({required String category}) async {
    try {
      final List<dynamic> response = await apiHelper.get(
        EndPoints.products,
        queryParameters: {ApiKeys.categoryName: category},
      );
      List<AllProductModel> myProduct = [];
      for(int i = 0; i < response.length; i++) {
        myProduct.add(
          AllProductModel.fromJson(response[i]),
        );
      }
      return myProduct;
    }on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }



}

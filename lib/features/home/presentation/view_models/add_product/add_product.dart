import 'package:store_app/core/api/api_helper.dart';
import 'package:store_app/core/api/end_points.dart';
import 'package:store_app/core/errors/exception.dart';
import 'package:store_app/features/home/data/models/all_product.dart';

class AddProduct {
  final ApiHelper apiHelper;
  AddProduct(this.apiHelper);

  addProduct({String? title, String? price, String? description, String? image, String? category}) async {
    try {
      final Map<String, dynamic> response = await apiHelper.post(
        EndPoints.products,
        data: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
        }
      );
      return AllProductModel.fromJson(response);
    }on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }



}

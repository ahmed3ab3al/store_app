import 'package:store_app/core/api/api_helper.dart';
import 'package:store_app/core/api/end_points.dart';
import 'package:store_app/core/errors/exception.dart';

class GetAllCategory {
  final ApiHelper apiHelper;
  GetAllCategory(this.apiHelper);

  getAllCategory() async {
    try {
      final response = await apiHelper.get(
        EndPoints.category,
      );
      return response;
    }on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }



}

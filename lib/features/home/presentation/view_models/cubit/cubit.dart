import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/api/api_helper.dart';
import 'package:store_app/core/api/end_points.dart';
import 'package:store_app/core/errors/exception.dart';
import 'package:store_app/features/home/data/models/all_product.dart';
import 'package:store_app/features/home/presentation/view_models/cubit/states.dart';

class StoreCubit extends Cubit<StoreStates> {
  final ApiHelper api;
  StoreCubit(this.api) : super(InitialState());

  static StoreCubit get(context) => BlocProvider.of(context);


  Future<List<AllProductModel>?>? getAllProduct() async{
    emit(GetAllProductLoadingState());
    try {
     final List<dynamic> response= await api.get(
        EndPoints.products,
      );
     emit(GetAllProductSuccessState());
      List<AllProductModel> myProduct = [];
      for(int i = 0; i <response.length; i++) {
        myProduct.add(
          AllProductModel.fromJson(response[i]),
        );
      }
      return myProduct;
    }on ServerException catch(e){
      emit(GetAllProductErrorState(error: e.errorModel.message));
    } catch (e) {
      emit(GetAllCategoryErrorState(error: e.toString()));
    }
  }


  getAllCategory() async {
    emit(GetAllCategoryLoadingState());
    try {
      final response = await api.get(
        EndPoints.category,
      );
      emit(GetAllCategorySuccessState());
      return response;
    }on ServerException catch (e) {
      emit(GetAllCategoryErrorState(error: e.errorModel.message));
    } catch (e) {
      emit(GetAllCategoryErrorState(error: e.toString()));
    }
  }


  getCategoryProduct({required String category}) async {
    emit(GetCategoryProductLoadingState());
    try {
      final List<dynamic> response = await api.get(
        EndPoints.products,
        queryParameters: {ApiKeys.categoryName: category},
      );
      emit(GetCategoryProductSuccessState());
      List<AllProductModel> myProduct = [];
      for(int i = 0; i < response.length; i++) {
        myProduct.add(
          AllProductModel.fromJson(response[i]),
        );
      }
      return myProduct;
    }on ServerException catch (e) {
      emit(GetCategoryProductErrorState(error: e.errorModel.message));
    }catch (e) {
      emit(GetCategoryProductErrorState(error: e.toString()));
    }
  }


 Future<AllProductModel?> updateProduct({ required int id, String? title, String? price, String? description, String? image, String? category}) async {
    emit(UpdateProductLoadingState());
    try {
      final Map<String, dynamic> response = await api.put(
         '${EndPoints.products}/$id',
          data: {
            'title': title,
            'price': price,
            'description': description,
            'image': image,
            'category': category,
          }
      );

      emit(UpdateProductSuccessState());
      return AllProductModel.fromJson(response);
    }on ServerException catch (e) {
      emit(UpdateProductErrorState(error: e.errorModel.message));
    } catch (e) {
      emit(UpdateProductErrorState(error: e.toString()));
    }
  }


  addProduct({String? title, String? price, String? description, String? image, String? category}) async {
    emit(AddProductLoadingState());
    try {
      final Map<String, dynamic> response = await api.post(
          EndPoints.products,
          data: {
            'title': title,
            'price': price,
            'description': description,
            'image': image,
            'category': category,
          }
      );

      emit(AddProductSuccessState());
      return AllProductModel.fromJson(response);
    }on ServerException catch (e) {
      emit(AddProductErrorState(error: e.errorModel.message));
    } catch (e) {
      emit(AddProductErrorState(error: e.toString()));
    }
  }


}
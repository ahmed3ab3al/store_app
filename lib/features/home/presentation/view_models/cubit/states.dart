abstract class StoreStates {}

class InitialState extends StoreStates {}


class GetAllProductSuccessState extends StoreStates {}

class GetAllProductLoadingState extends StoreStates {}

class GetAllProductErrorState extends StoreStates {
  final String error;
  GetAllProductErrorState({required this.error});}

class GetAllCategoryLoadingState extends StoreStates {}

class GetAllCategoryErrorState extends StoreStates {
  final String error;
  GetAllCategoryErrorState({required this.error});
}

class GetAllCategorySuccessState extends StoreStates {}

class GetCategoryProductLoadingState extends StoreStates {}

class GetCategoryProductErrorState extends StoreStates {
  final String error;
  GetCategoryProductErrorState({required this.error});
}

class GetCategoryProductSuccessState extends StoreStates {}

class UpdateProductLoadingState extends StoreStates {}

class UpdateProductErrorState extends StoreStates {
  final String error;
  UpdateProductErrorState({required this.error});
}

class UpdateProductSuccessState extends StoreStates {}

class AddProductLoadingState extends StoreStates {}

class AddProductErrorState extends StoreStates {
  final String error;
  AddProductErrorState({required this.error});
}

class AddProductSuccessState extends StoreStates {}
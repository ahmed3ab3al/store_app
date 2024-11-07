import 'package:store_app/core/api/end_points.dart';

class ErrorModel {
  String status;
  String message;

  ErrorModel({required this.status, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKeys.status],
      message: json[ApiKeys.message],
    );
  }
}

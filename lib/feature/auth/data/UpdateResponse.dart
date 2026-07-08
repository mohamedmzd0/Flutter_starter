import 'package:starter/feature/auth/data/UpdateModel.dart';

class UpdateResponse {
  final UpdateModel? result;
  final String? responseMessage;
  final dynamic errorMessage;
  final bool? isError;
  final bool? success;
  final dynamic message;

  const UpdateResponse({
    this.result,
    this.responseMessage,
    this.errorMessage,
    this.isError,
    this.success,
    this.message,
  });

  factory UpdateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResponse(
      result: json['result'] != null
          ? UpdateModel.fromJson(json['result'])
          : null,
      responseMessage: json['responseMessage'],
      errorMessage: json['errorMessage'],
      isError: json['isError'],
      success: json['success'],
      message: json['Message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result?.toJson(),
      'responseMessage': responseMessage,
      'errorMessage': errorMessage,
      'isError': isError,
      'success': success,
      'Message': message,
    };
  }
}

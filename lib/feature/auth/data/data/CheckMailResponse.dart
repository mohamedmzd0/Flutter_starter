
class CheckMailResponse  {
  CheckMailResponse({
    this.result, this.responseMessage, this.errorMessage, this.isError, this.success, this.message,
  });

  final String? responseMessage;
  final String? errorMessage;
  final bool? isError;
  final bool? success;
  final String? message;
  Result? result;

  factory CheckMailResponse.fromJson(Map<String, dynamic> json) {
    return CheckMailResponse(
      result: json['result'] != null
          ? Result.fromJson(json['result'])
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

class Result {
  Result({
    this.type,
    this.dualLogin,
  });

  final String? type;
  final bool? dualLogin;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      type: json['type'] as String?,
      dualLogin: json['dual_login'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'dual_login': dualLogin,
    };
  }
}
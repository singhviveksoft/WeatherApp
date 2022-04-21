class Status {
  int code;
  dynamic response;
  Status({ this.code=101, required this.response});
}
class Failure {
  int code;
  dynamic errorResponse;
  Failure({required this.code, required this.errorResponse});
}

class UserError {
  int code;
  Object message;
  UserError({required this.code, required this.message});
}
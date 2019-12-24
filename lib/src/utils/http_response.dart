class HttpResponse {
  bool isSuccess;
  String message;
  Object data;

  HttpResponse({this.isSuccess = false, this.message = '', this.data});
}

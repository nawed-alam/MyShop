class HttpExcepion implements Exception{
  final  String message;
  HttpExcepion(this.message);
   @override
  String toString() {
    return message;
    //return super.toString();
  }
}
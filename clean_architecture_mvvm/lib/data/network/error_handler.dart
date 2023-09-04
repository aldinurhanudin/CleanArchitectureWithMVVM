enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION
}

class ResponseData{
  static const int SUCCESS=200;
  static const int NO_CONTENT=201;
  static const int BAD_REQUEST=400;
  static const int FORBIDDEN=403;
  static const int UNAUTHORISED=401;
  static const int NOT_FOUND=404;
  static const int INTERNAL_SERVER_ERROR=500;


  static const int UNKNOWN=-1;
  static const int CONNECT_TIMEOUT=-2;
  static const int CANCEL=-3;
  static const int RECEIVE_TIMEOUT=-4;
  static const int SEND_TIMEOUT=-5;
  static const int CACHE_ERROR=-6;
  static const int NO_INTERNET_CONNECTION=-7;

}

class ResponseMessage{
  static const String SUCCESS="success";
  static const String NO_CONTENT="sucess with no content";
  static const String BAD_REQUEST="Bad request, try again later";
  static const String FORBIDDEN="forbiden request, try again later";
  static const String UNAUTHORISED="user is unauthorised, try again later";
  static const String NOT_FOUND="Url is not found, try again later";
  static const String INTERNAL_SERVER_ERROR="some thing went wrong, try again later";


  static const String UNKNOWN="some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT="time out error, try again later";
  static const String CANCEL="request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT="time out error,try again later";
  static const String SEND_TIMEOUT="time out error, try again later";
  static const String CACHE_ERROR="Cache error, try again later";
  static const String NO_INTERNET_CONNECTION="Please check your internet connection";

}
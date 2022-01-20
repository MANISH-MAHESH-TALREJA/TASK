class AppException implements Exception
{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString()
  {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException
{
  FetchDataException([String? message]) : super(message, "ERROR DURING COMMUNICATION : ");
}

class BadRequestException extends AppException
{
  BadRequestException([message]) : super(message, "INVALID REQUEST : ");
}

class UnauthorisedException extends AppException
{
  UnauthorisedException([message]) : super(message, "UNAUTHORIZED REQUEST : ");
}

class InvalidInputException extends AppException
{
  InvalidInputException([String? message]) : super(message, "INVALID INPUT : ");
}
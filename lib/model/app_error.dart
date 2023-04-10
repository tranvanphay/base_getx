class AppError {
  AppError(
      {this.errorTitle = 'Error',
      this.errorCode = -1,
      this.errorMsg = 'Unhandled Error'});

  int errorCode;
  String errorMsg;

  String errorTitle;

  @override
  String toString() {
    return '[$errorCode]:$errorMsg';
  }
}

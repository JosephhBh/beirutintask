class ErrorMessage {
  String title;
  String message;
  bool isRed;
  bool hasTitle;
  ErrorMessage({
    required this.title,
    required this.message,
    this.isRed = true,
    this.hasTitle = true,
  });
}

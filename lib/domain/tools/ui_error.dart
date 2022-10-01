class UIError extends Error {
  final String title;
  final String description;
  final String errorCode;

  UIError({
    required this.title,
    required this.description,
    required this.errorCode,
  });
}

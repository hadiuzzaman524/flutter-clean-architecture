class FailureModel {
  FailureModel({required this.code, required this.message, this.data});

  factory FailureModel.generic() {
    return FailureModel(code: '', message: 'A error has occurred');
  }

  final String code;
  final String message;
  final Object? data;
}

class BackendError {
  final String code;
  final String message;
  final List<dynamic> params;
  final String messageType;

  BackendError({
    required this.code,
    required this.message,
    required this.params,
    required this.messageType,
  });

  factory BackendError.fromJson(Map<String, dynamic> json) {
    final metaMessage = json['meta']!['message'];

    return BackendError(
      code: metaMessage['code']!,
      message: metaMessage['message']!,
      params: metaMessage['params']!,
      messageType: metaMessage['messageType']!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': {
        'message': {
          'code': code,
          'message': message,
          'params': params,
          'messageType': messageType,
        },
      },
    };
  }
}

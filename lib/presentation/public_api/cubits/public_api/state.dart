import 'package:network_calling/domain/entities/public_api/public_api_model.dart';

class PublicApiState {
  PublicApiState();
}

class ApiFetchLoading extends PublicApiState {
  ApiFetchLoading();
}

class ApiFetchLoaded extends PublicApiState {
  ApiFetchLoaded({required this.publicApiModel});
  final PublicApiModel publicApiModel;
}

class ApiFetchError extends PublicApiState {
  ApiFetchError({required this.errorMessage});
  final String errorMessage;
}

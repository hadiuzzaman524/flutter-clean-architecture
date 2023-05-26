import 'package:network_calling/domain/entities/public_api/public_api_entity.dart';

class PublicApiState {
  PublicApiState();
}

class ApiFetchLoading extends PublicApiState {
  ApiFetchLoading();
}

class ApiFetchLoaded extends PublicApiState {
  ApiFetchLoaded({required this.publicApiEntity});
  final PublicApiEntity publicApiEntity;
}

class ApiFetchError extends PublicApiState {
  ApiFetchError({required this.errorMessage});
  final String errorMessage;
}

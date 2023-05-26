import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/entities/public_api/public_api_entity.dart';
import 'package:network_calling/domain/repository/public_api/public_api_repository.dart';

@injectable
class GetApiUseCase {
  GetApiUseCase({required this.publicApiRepository});

  final PublicApiRepository publicApiRepository;

  Future<PublicApiEntity> getAllApi() async {
    return publicApiRepository.getAllApi();
  }
}

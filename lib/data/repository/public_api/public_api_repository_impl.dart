import 'package:injectable/injectable.dart';
import 'package:network_calling/data/data_sources/public_api/remote_data_sources.dart';
import 'package:network_calling/domain/entities/public_api/public_api_entity.dart';
import 'package:network_calling/domain/repository/public_api/public_api_repository.dart';

@Injectable(as: PublicApiRepository)
class PublicApiImpl implements PublicApiRepository {
  PublicApiImpl({required this.publicApiRemoteDataSource});

  final PublicApiRemoteDataSource publicApiRemoteDataSource;

  @override
  Future<PublicApiEntity> getAllApi() async {
    return publicApiRemoteDataSource.getAllApi();
  }
}

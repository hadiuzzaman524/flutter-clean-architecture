import 'package:injectable/injectable.dart';
import 'package:network_calling/data/data_sources/public_api/remote_data_sources.dart';
import 'package:network_calling/data/repository/re_mapper/api_remapper.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/domain/services/public_api/public_api_services.dart';

@Injectable(as: PublicApiServices)
class PublicApiImpl implements PublicApiServices {
  PublicApiImpl(this._apiReMapper, this._remoteDataSource);

  final RemoteDataSources _remoteDataSource;
  final ApiReMapper _apiReMapper;

  @override
  Future<List<ApiEntity>> getAllApi() async {
    final response = await _remoteDataSource.getAllApi();
    final entityList = _apiReMapper.toPublicApiList(response);
    return entityList;
  }
}

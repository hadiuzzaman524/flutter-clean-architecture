import 'package:injectable/injectable.dart';
import 'package:network_calling/data/data_sources/public_api/remote_data_sources.dart';
import 'package:network_calling/data/repository/re_mapper/api_remapper.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/domain/services/public_api/public_api_services.dart';
import 'package:network_calling/services/dio_services.dart';

@Injectable(as: PublicApiServices)
class PublicApiImpl implements PublicApiServices {
  PublicApiImpl(this._dioService, this._apiReMapper) {
    _remoteDataSource = RemoteDataSources(_dioService.dio);
  }

  late RemoteDataSources _remoteDataSource;
  final ApiReMapper _apiReMapper;
  final DioService _dioService;

  @override
  Future<List<ApiEntity>> getAllApi() async {
    final response = await _remoteDataSource.getAllApi();
    final entityList = _apiReMapper.toPublicApiList(response);
    return entityList;
  }
}

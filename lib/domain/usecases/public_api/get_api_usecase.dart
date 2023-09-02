import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/domain/services/public_api/public_api_services.dart';
import 'package:network_calling/domain/usecases/use_case.dart';

@injectable
class GetApiUseCase implements UseCase<List<ApiEntity>, void> {
  GetApiUseCase(this._apiServices);

  final PublicApiServices _apiServices;

  @override
  Future<List<ApiEntity>> run({void param}) => _apiServices.getAllApi();
}

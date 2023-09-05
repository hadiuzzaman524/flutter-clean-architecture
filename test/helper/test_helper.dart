import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:network_calling/domain/services/public_api/public_api_services.dart';

@GenerateMocks(
  [PublicApiServices],
  customMocks: [MockSpec<http.Client>(as: #MockHttpclient)],
)
void main() {}

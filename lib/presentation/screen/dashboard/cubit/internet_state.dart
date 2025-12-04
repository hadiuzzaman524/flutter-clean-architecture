part of 'internet_cubit.dart';

@immutable
class InternetState {
  final bool isConnected;

  const InternetState._(this.isConnected);

  const InternetState.connected() : this._(true);
  const InternetState.disconnected() : this._(false);
}

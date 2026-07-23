import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SubscriptionLocalDataSource {
  SubscriptionLocalDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;
  static const String _subscriptionKey = 'is_subscribed_key';

  bool isSubscribed() => _sharedPreferences.getBool(_subscriptionKey) ?? false;

  Future<void> setSubscriptionStatus(bool value) async =>
      _sharedPreferences.setBool(_subscriptionKey, value);
}

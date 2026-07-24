abstract class SubscriptionRepository {
  bool isSubscribed();
  Future<void> setSubscriptionStatus(bool value);
}

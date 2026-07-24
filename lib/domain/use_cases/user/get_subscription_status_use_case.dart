import 'package:injectable/injectable.dart';
import 'package:flutter_template/domain/repository/user/subscription_repository.dart';

@singleton
class GetSubscriptionStatusUseCase {
  GetSubscriptionStatusUseCase(this._subscriptionRepository);

  final SubscriptionRepository _subscriptionRepository;

  bool execute() => _subscriptionRepository.isSubscribed();
}

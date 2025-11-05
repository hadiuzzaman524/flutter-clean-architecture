mixin BaseUseCase<Output> {
  /// Execute use case with named input parameter
  Future<Output> execute();
}

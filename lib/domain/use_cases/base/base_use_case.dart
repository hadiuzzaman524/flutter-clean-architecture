/// Contract for use cases that take no input.
mixin BaseUseCase<Output> {
  /// Execute the use case.
  Future<Output> execute();
}

/// Contract for use cases that require an input parameter.
mixin BaseUseCaseWithParams<Output, Params> {
  /// Execute the use case with the given [params].
  Future<Output> execute(Params params);
}

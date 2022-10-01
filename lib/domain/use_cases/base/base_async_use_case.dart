abstract class BaseAsyncUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

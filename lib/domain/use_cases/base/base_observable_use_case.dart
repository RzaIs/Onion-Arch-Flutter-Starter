abstract class BaseObservableUseCase<Input, Output> {
  Stream<Output> execute(Input input);
}

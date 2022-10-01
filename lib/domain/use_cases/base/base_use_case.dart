abstract class BaseUseCase<Input, Output> {
  Output execute(Input input);
}

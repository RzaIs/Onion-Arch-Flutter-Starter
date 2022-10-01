import 'package:rxdart/rxdart.dart';

class BaseService {
  final BehaviorSubject _errorSubject = BehaviorSubject();

  void show({required Error error}) {
    _errorSubject.onAdd(error);
  }
}

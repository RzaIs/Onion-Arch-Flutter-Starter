import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseStatefulService<Effect> {
  final BehaviorSubject<Effect> _effectSubject = BehaviorSubject();
  final BehaviorSubject<Error> _errorSubject = BehaviorSubject();

  Stream<Error> observeError() {
    return _errorSubject.asBroadcastStream();
  }

  Stream<Effect> observeEffect() {
    return _effectSubject.asBroadcastStream();
  }

  void show({required Error error}) {
    _errorSubject.add(error);
  }
}

class BaseStatelessService<Effect> {
  final BehaviorSubject<Effect> _effectSubject = BehaviorSubject();
  final BehaviorSubject<Pair<BuildContext, Error>> _errorSubject =
      BehaviorSubject();

  Stream<Pair<BuildContext, Error>> observeError() {
    return _errorSubject.asBroadcastStream();
  }

  Stream<Effect> observeEffect() {
    return _effectSubject.asBroadcastStream();
  }

  void show({required BuildContext context, required Error error}) {
    _errorSubject.add(Pair(context, error));
  }
}

class Pair<T1, T2> {
  final T1 value1;
  final T2 value2;

  const Pair(this.value1, this.value2);
}

import 'package:flutter/material.dart';
import 'package:rzagram/domain/tools/ui_error.dart';
import 'package:rzagram/presenter/navigation/navigation_provider_ac.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_service.dart';

abstract class BaseStatelessPage<Effect,
    Service extends BaseStatelessService<Effect>> extends StatelessWidget {
  final NavigationProviderAC navigationProvider;
  final Service service;

  BaseStatelessPage({
    required this.navigationProvider,
    required this.service,
    super.key,
  }) {
    service.observeEffect().listen((effect) {
      _observe(effect: effect);
    });
    service.observeError().listen((pair) {
      var context = pair.value1;
      var error = pair.value2;
      if (error is UIError) {
        _showErrorAlert(context: context, error: error);
      }
    });
  }

  void _observe({required Effect effect}) {}
  void _showErrorAlert(
      {required BuildContext context, required UIError error}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(error.title),
          content: Text(error.description),
          actions: [
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

abstract class BaseStatefulPage<Effect,
    Service extends BaseStatefulService<Effect>> extends StatefulWidget {
  final NavigationProviderAC navigationProvider;
  final Service service;

  const BaseStatefulPage({
    required this.navigationProvider,
    required this.service,
    super.key,
  });
}

abstract class BaseState<Effect, Service extends BaseStatefulService<Effect>,
    Page extends BaseStatefulPage<Effect, Service>> extends State<Page> {
  @override
  void initState() {
    widget.service.observeError().listen((error) {
      if (error is UIError) {
        _showErrorAlert(error: error);
      }
    });
    widget.service.observeEffect().listen((effect) {
      _observe(effect: effect);
    });
    super.initState();
  }

  void _observe({required Effect effect}) {}
  void _showErrorAlert({required UIError error}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(error.title),
          content: Text(error.description),
          actions: [
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

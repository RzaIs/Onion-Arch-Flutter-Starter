import 'package:flutter/material.dart';
import 'package:rzagram/presenter/navigation/navigation_provider_ac.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_service.dart';

abstract class BaseStatelessPage<Service extends BaseService>
    extends StatelessWidget {
  final NavigationProviderAC navigationProvider;
  final Service service;

  const BaseStatelessPage({
    required this.navigationProvider,
    required this.service,
    super.key,
  });
}

abstract class BaseStatefulPage<Service extends BaseService>
    extends StatefulWidget {
  final NavigationProviderAC navigationProvider;
  final Service service;

  const BaseStatefulPage({
    required this.navigationProvider,
    required this.service,
    super.key,
  });
}

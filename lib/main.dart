import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rzagram/data/di/data_di.dart';
import 'package:rzagram/domain/di/domain_di.dart';
import 'package:rzagram/presenter/di/presenter_di.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_page.dart';

GetIt getIt = GetIt.instance;

void main() {
  dataAssemble(baseURL: 'jsonplaceholder.typicode.com');
  domainAssemble();
  presenterAssemble();
  runApp(
    MaterialApp(
      home: getIt.get<PostListPage>(),
    ),
  );
}

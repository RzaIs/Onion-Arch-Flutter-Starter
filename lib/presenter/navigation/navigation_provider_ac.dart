import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/presenter/pages_and_services/post_details/post_details_page.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_page.dart';

abstract class NavigationProviderAC {
  PostListPage get postPage;
  PostDetailsPage postDetailsPage({required PostEntity postEntity});
}

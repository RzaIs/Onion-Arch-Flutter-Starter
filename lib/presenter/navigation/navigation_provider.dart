import 'package:get_it/get_it.dart';
import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/presenter/pages_and_services/post_details/post_details_page.dart';
import 'package:rzagram/presenter/pages_and_services/post_details/post_details_service.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_page.dart';
import 'navigation_provider_ac.dart';

class NavigationProvider extends NavigationProviderAC {
  final GetIt _getIt;

  NavigationProvider(this._getIt);

  @override
  PostListPage get postPage {
    return _getIt.get<PostListPage>();
  }

  @override
  PostDetailsPage postDetailsPage({required PostEntity postEntity}) {
    return PostDetailsPage(
      navigationProvider: _getIt.get<NavigationProviderAC>(),
      service: PostDetailsService(postEntity: postEntity),
    );
  }
}

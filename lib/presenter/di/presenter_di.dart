import 'package:get_it/get_it.dart';
import 'package:rzagram/domain/use_cases/post/observe_posts_use_case.dart';
import 'package:rzagram/domain/use_cases/post/sync_posts_use_case.dart';
import 'package:rzagram/presenter/navigation/navigation_provider.dart';
import 'package:rzagram/presenter/navigation/navigation_provider_ac.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_page.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_service.dart';

GetIt presenterGetIt = GetIt.instance;

void presenterAssemble() {
  presenterGetIt.registerFactory(() {
    NavigationProviderAC np = NavigationProvider(presenterGetIt);
    return np;
  });

  presenterGetIt.registerFactory(() {
    return PostListService(
      presenterGetIt.get<SyncPostsUseCase>(),
      presenterGetIt.get<ObservePostsUseCase>(),
    );
  });

  presenterGetIt.registerFactory(() {
    return PostListPage(
      navigationProvider: presenterGetIt.get<NavigationProviderAC>(),
      service: presenterGetIt.get<PostListService>(),
    );
  });
}

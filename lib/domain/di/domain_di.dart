import 'package:get_it/get_it.dart';
import 'package:rzagram/domain/abstract_repos/post_repo_ac.dart';
import 'package:rzagram/domain/use_cases/post/observe_posts_use_case.dart';
import 'package:rzagram/domain/use_cases/post/sync_posts_use_case.dart';

GetIt domainGetIt = GetIt.instance;

void domainAssemble() {
  domainGetIt.registerFactory(() {
    return SyncPostsUseCase(repo: domainGetIt.get<PostRepoAC>());
  });

  domainGetIt.registerFactory(() {
    return ObservePostsUseCase(repo: domainGetIt.get<PostRepoAC>());
  });
}

import 'package:rzagram/domain/abstract_repos/post_repo_ac.dart';
import 'package:rzagram/domain/use_cases/base/base_async_use_case.dart';

class SyncPostsUseCase extends BaseAsyncUseCase<void, void> {
  final PostRepoAC repo;

  SyncPostsUseCase({required this.repo});

  @override
  Future<void> execute(void input) async {
    await repo.syncPosts();
  }
}

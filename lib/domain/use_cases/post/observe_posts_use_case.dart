import 'package:rzagram/domain/abstract_repos/post_repo_ac.dart';
import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/domain/use_cases/base/base_observable_use_case.dart';

class ObservePostsUseCase
    extends BaseObservableUseCase<void, List<PostEntity>> {
  final PostRepoAC repo;

  ObservePostsUseCase({required this.repo});

  @override
  Stream<List<PostEntity>> execute(void input) {
    return repo.observePosts();
  }
}

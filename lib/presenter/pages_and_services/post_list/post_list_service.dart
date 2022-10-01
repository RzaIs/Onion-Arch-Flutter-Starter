import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/domain/use_cases/post/observe_posts_use_case.dart';
import 'package:rzagram/domain/use_cases/post/sync_posts_use_case.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_service.dart';

class PostListService extends BaseStatefulService<void> {
  List<PostEntity> posts = [];

  final SyncPostsUseCase _syncPostsUseCase;
  final ObservePostsUseCase _observePostsUseCase;

  PostListService(this._syncPostsUseCase, this._observePostsUseCase);

  void syncPosts() {
    _syncPostsUseCase.execute(null).catchError((error) {
      show(error: error);
    });
  }

  Stream<List<PostEntity>> observePosts() {
    return _observePostsUseCase.execute(null);
  }
}

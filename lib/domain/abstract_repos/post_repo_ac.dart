import 'package:rzagram/domain/entities/post_entity.dart';

abstract class PostRepoAC {
  Future<void> syncPosts();
  void delete();
  Stream<List<PostEntity>> observePosts();
}

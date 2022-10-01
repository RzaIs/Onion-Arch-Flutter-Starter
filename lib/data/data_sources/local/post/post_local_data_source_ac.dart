import 'package:rzagram/data/models/local/post/post_local_dto.dart';

abstract class PostLocalDataSourceAC {
  void delete();
  void write({required List<PostLocalDTO> posts});
  Stream<List<PostLocalDTO>> observePosts();
}

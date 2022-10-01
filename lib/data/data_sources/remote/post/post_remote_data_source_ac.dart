import 'package:rzagram/data/models/remote/post/post_remote_dto.dart';

abstract class PostRemoteDataSourceAC {
  Future<List<PostRemoteDTO>> getPosts();
}

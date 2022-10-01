import 'package:rzagram/data/data_sources/local/post/post_local_data_source_ac.dart';
import 'package:rzagram/data/data_sources/remote/post/post_remote_data_source_ac.dart';
import 'package:rzagram/data/models/local/post/post_local_dto.dart';
import 'package:rzagram/data/models/remote/post/post_remote_dto.dart';
import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/data/mappers/local_2_domain.dart';
import 'package:rzagram/data/mappers/remote_2_local.dart';
import 'package:rzagram/domain/tools/ui_error.dart';
import 'package:rzagram/domain/abstract_repos/post_repo_ac.dart';

class PostRepo extends PostRepoAC {
  final PostRemoteDataSourceAC remoteDataSource;
  final PostLocalDataSourceAC localDataSource;

  PostRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  void delete() {
    localDataSource.delete();
  }

  @override
  Stream<List<PostEntity>> observePosts() {
    return localDataSource.observePosts().map((localDTOs) {
      return [...localDTOs.map((localDTO) => localDTO.toDomain())];
    });
  }

  @override
  Future<void> syncPosts() async {
    int code = 0;
    try {
      List<PostRemoteDTO> remoteDTOs = await remoteDataSource.getPosts();
      code = 1;
      List<PostLocalDTO> localDTOs = [...remoteDTOs.map((o) => o.toLocal())];
      localDataSource.write(posts: localDTOs);
    } catch (error) {
      throw UIError(
        title: 'Sync Post Error',
        description: error.toString(),
        errorCode: '@0.$code',
      );
    }
  }
}

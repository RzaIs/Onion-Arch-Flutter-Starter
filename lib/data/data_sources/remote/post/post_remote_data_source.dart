import 'package:rzagram/data/data_sources/remote/post/post_api.dart';
import 'package:rzagram/data/data_sources/remote/post/post_remote_data_source_ac.dart';
import 'package:rzagram/data/models/remote/post/post_remote_dto.dart';
import 'package:rzagram/data/networking/network_provider_ac.dart';

class PostRemoteDataSource extends PostRemoteDataSourceAC {
  final NetworkProviderAC networkProvider;

  PostRemoteDataSource({required this.networkProvider});

  @override
  Future<List<PostRemoteDTO>> getPosts() async {
    List<dynamic> jsonArray = await networkProvider.request(
      endpoint: PostAPI.getPost,
      method: HttpMethod.get,
    );
    return [
      ...jsonArray.map((json) => PostRemoteDTO.fromJson(json)),
    ];
  }
}

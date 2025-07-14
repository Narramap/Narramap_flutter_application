
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/shared/data/inteceptors/api_response_interceptor.dart';

@Injectable()
class PostsRepository implements IPostsRepository  {

  @override
  Future<Post?> register(NewPostDTO newPost) async {

    final post = await DioClient.post(
      path: "4000/posts", 
      body: newPost.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor<Post>.fromJson(
        json, 
        Post.fromJson
      )
    );

    return post?.data;
  }

  @override
  Future<List<Post>?> getAll() async {
    
    final posts = await DioClient.get(
      path: "4000/posts", 
      fromJsonT: (json) => ApiResponseInterceptor<List<Post>>.fromJson(
        json, 
        (data) => (data as List).map((postJson) => Post.fromJson(postJson)).toList()

      )
    );

    return posts?.data;
  }
}
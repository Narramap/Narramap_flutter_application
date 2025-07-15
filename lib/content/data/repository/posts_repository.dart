
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/shared/data/inteceptors/api_response_interceptor.dart';

@Injectable()
class PostsRepository implements IPostsRepository  {

  final url = "https://narramappostsapi-production.up.railway.app";

  @override
  Future<Post?> register(NewPostDTO newPost) async {

    final post = await DioClient.post(
      path: "$url/posts", 
      body: newPost.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor<Post>.fromJson(
        json, 
        (json) => Post.fromJson(json as Map<String, dynamic>)
      )
    );

    return post?.data;
  }

  @override
  Future<List<Post>?> getAll() async {
    
    final posts = await DioClient.get(
      path: "$url/posts", 
      fromJsonT: (json) => ApiResponseInterceptor<List<Post>>.fromJson(
        json, 
        (data) => (data as List<dynamic>).map(
          (postJson) => Post.fromJson(postJson as Map<String, dynamic>)
        ).toList(),
        
      )
    );

    return posts?.data;
  }

  @override
  Future<Post?> reactByPostId(ReactionToPostDTO reactionDTO) async {

    final post = await DioClient.post(
      path: "$url/posts/reactions", 
      body: reactionDTO.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor<Post>.fromJson(
        json, 
        (json) => Post.fromJson(json as Map<String, dynamic>)
      )
    );
    
    return post?.data;
  }
}
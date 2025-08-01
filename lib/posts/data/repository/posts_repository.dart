import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:narramap/posts/data/dto/create_report_dto.dart';
import 'package:narramap/posts/data/dto/new_post_dto.dart';
import 'package:narramap/posts/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/posts/data/interceptors/post_view_interceptor.dart';
import 'package:narramap/posts/domain/model/emotional_post.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/posts/domain/model/report.dart';
import 'package:narramap/posts/domain/repository/i_posts_repository.dart';
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
  Future<List<EmotionalPost>?> getEmotionalPosts() async {
    
    final posts = await DioClient.get(
      path: "$url/posts/emotional", 
      fromJsonT: (json) => ApiResponseInterceptor<List<EmotionalPost>>.fromJson(
        json, 
        (data) => (data as List<dynamic>).map(
          (postJson) => EmotionalPost.fromJson(postJson as Map<String, dynamic>)
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

  @override
  Future<List<Post>?> getAllByUserId(String userId) async {
    
    final posts = await DioClient.get(
      path: "$url/posts/user/$userId", 
      fromJsonT: (json) => ApiResponseInterceptor.fromJson(
        json, 
        (data) => (data as List<dynamic>).map(
          (postJson) => Post.fromJson(postJson as Map<String, dynamic>)
        ).toList(),
      )
    );

    return posts?.data;
  }

  @override
  Future<PostViewInterceptor?> registerPostView(String postId, String userId) async {

    final postView = await DioClient.post(
      path: "$url/posts/$postId/views/$userId", 
      body: {}, 
      fromJsonT: (json) => ApiResponseInterceptor<PostViewInterceptor>.fromJson(
        json, 
        (viewJson) => PostViewInterceptor.fromJson(viewJson as Map<String, dynamic>)
      )
    );

    return postView?.data;
  }

  @override
  Future<String?> deletePost(String postId) async {


    final deletedPostId = await DioClient.delete(
      path: "$url/posts/$postId", 
      fromJsonT: (json) => ApiResponseInterceptor<String>.fromJson(
        json, 
        (data) => data as String
      )
    );

    return deletedPostId?.data;
  }

  @override
  Future<ReportEntity?> reportPost(String postId, CreateReportDto report) async {
    final res = await DioClient.post(
      path: "$url/posts/$postId/report", 
      body: report.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor.fromJson(
        json, 
        (reportJson) => ReportEntity.fromJson(reportJson as Map<String, dynamic>)
      )
    );

    return res?.data;
  }  
}
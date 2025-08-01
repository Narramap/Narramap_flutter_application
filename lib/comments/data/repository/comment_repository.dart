import 'package:injectable/injectable.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/comments/data/dto/comment_dto.dart';
import 'package:narramap/shared/data/inteceptors/api_response_interceptor.dart';
import 'package:narramap/comments/data/interceptors/bussiness_comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/event_comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/post_comment_interceptor.dart';
import 'package:narramap/comments/domain/repository/i_comment_repository.dart';

@Injectable()
class CommentRepository extends ICommentRepository {

  final url = "https://narramapcommentsapi-production.up.railway.app/comments";

  @override
  Future<List<CommentInterceptor>?> getPostComments(String postId) async {
    
    final comments = await DioClient.get(
      path: "$url/posts/$postId", 
      fromJsonT: (json) => ApiResponseInterceptor<List<CommentInterceptor>>.fromJson(
        json, 
        (commentsJson) => (commentsJson as List<dynamic>).map(
          (commentJson) => CommentInterceptor.fromJson(commentJson as Map<String, dynamic>)
        ).toList()
      )
    );

    return comments?.data;
  }

  @override
  Future<List<CommentInterceptor>?> getEventComments(String eventId) async {
    final comments = await DioClient.get(
      path: "$url/events/$eventId", 
      fromJsonT: (json) => ApiResponseInterceptor<List<CommentInterceptor>>.fromJson(
        json, 
        (commentsJson) => (commentsJson as List<dynamic>).map(
          (commentJson) => CommentInterceptor.fromJson(commentJson as Map<String, dynamic>)
        ).toList()
      )
    );

    return comments?.data;
  }

  @override
  Future<List<CommentInterceptor>?> getBussinessComments(String bussinessId) async {

    final comments = await DioClient.get(
      path: "$url/bussiness/$bussinessId", 
      fromJsonT: (json) => ApiResponseInterceptor<List<CommentInterceptor>>.fromJson(
        json, 
        (commentsJson) => (commentsJson as List<dynamic>).map(
          (commentJson) => CommentInterceptor.fromJson(commentJson as Map<String, dynamic>)
        ).toList()
      )
    );

    return comments?.data;
  }



  @override
  Future<PostCommentInterceptor?> registerPostComment(CommentDto comment, String postId) async {

    final postComment = await DioClient.post(
      path: "$url/posts/$postId", 
      body: comment.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor.fromJson(
        json, 
        (jsonComment) => PostCommentInterceptor.fromJson(jsonComment as Map<String, dynamic>)
      )
    );

    return postComment?.data;
    
  }

  @override
  Future<EventCommentInterceptor?> registerEventComment(CommentDto comment, String eventId) async {
    final eventComment = await DioClient.post(
      path: "$url/events/$eventId", 
      body: comment.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor.fromJson(
        json, 
        (jsonComment) => EventCommentInterceptor.fromJson(jsonComment as Map<String, dynamic>)
      )
    );

    return eventComment?.data;
  }

  @override
  Future<BussinessCommentInterceptor?> registerBussinessComment(CommentDto comment, String bussinessId) async {

    final bussinessComment = await DioClient.post(
      path: "$url/bussiness/$bussinessId", 
      body: comment.toJsonMap(), 
      fromJsonT: (json) => ApiResponseInterceptor.fromJson(
        json, 
        (jsonComment) => BussinessCommentInterceptor.fromJson(json as Map<String, dynamic>)
      )
    );

    return bussinessComment?.data;
    
  }

  @override
  Future<String?> deleteCommentById(String commentId) async {
    
    final deletedId = await DioClient.delete(
      path: "$url/$commentId", 
      fromJsonT: (json) => ApiResponseInterceptor<String>.fromJson(
        json, 
        (data) => data
      )
    );

    return deletedId?.data;
  }


}
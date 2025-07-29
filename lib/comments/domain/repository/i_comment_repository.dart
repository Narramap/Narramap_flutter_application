
import 'package:narramap/comments/data/dto/comment_dto.dart';
import 'package:narramap/comments/data/interceptors/bussiness_comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/event_comment_interceptor.dart';
import 'package:narramap/comments/data/interceptors/post_comment_interceptor.dart';

abstract class ICommentRepository {

  Future<List<CommentInterceptor>?> getPostComments(String postId);
  Future<List<CommentInterceptor>?> getEventComments(String eventId);
  Future<List<CommentInterceptor>?> getBussinessComments(String bussinessId);

  Future<PostCommentInterceptor?> registerPostComment(CommentDto comment, String postId);
  Future<EventCommentInterceptor?> registerEventComment(CommentDto comment, String eventId);
  Future<BussinessCommentInterceptor?> registerBussinessComment(CommentDto comment, String bussinessId);

  Future<String?> deleteCommentById(String commentId);

}
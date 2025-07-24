
import 'package:narramap/shared/data/dto/comment_dto.dart';
import 'package:narramap/shared/data/inteceptors/bussiness_comment_interceptor.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/data/inteceptors/event_comment_interceptor.dart';
import 'package:narramap/shared/data/inteceptors/post_comment_interceptor.dart';

abstract class ICommentRepository {

  Future<List<CommentInterceptor>?> getPostComments(String postId);
  Future<List<CommentInterceptor>?> getEventComments(String eventId);
  Future<List<CommentInterceptor>?> getBussinessComments(String bussinessId);

  Future<PostCommentInterceptor?> registerPostComment(CommentDto comment, String postId);
  Future<EventCommentInterceptor?> registerEventComment(CommentDto comment, String eventId);
  Future<BussinessCommentInterceptor?> registerBussinessComment(CommentDto comment, String bussinessId);

  Future<String?> deleteCommentById(String commentId);

}
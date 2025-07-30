
import 'package:flutter/material.dart';
import 'package:narramap/comments/domain/use_cases/comment_bussiness_use_case.dart';
import 'package:narramap/comments/domain/use_cases/comment_event_use_case.dart';
import 'package:narramap/comments/domain/use_cases/get_bussiness_comments_use_case.dart';
import 'package:narramap/comments/domain/use_cases/comment_post_use_case.dart';
import 'package:narramap/comments/domain/use_cases/delete_comment_use_case.dart';
import 'package:narramap/comments/domain/use_cases/get_event_comments_use_case.dart';
import 'package:narramap/comments/domain/use_cases/get_post_comments_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/comments/data/dto/comment_dto.dart';
import 'package:narramap/comments/data/interceptors/comment_interceptor.dart';
import 'package:narramap/comments/presentation/widgets/comments_container.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class CommentContainerNotifier extends ChangeNotifier {

  final GetUserProfileUseCase _getProfileUseCase = getIt<GetUserProfileUseCase>();
  final GetPostCommentsUseCase _getPostCommentsUseCase = getIt<GetPostCommentsUseCase>();
  final GetEventCommentsUseCase _getEventCommentsUseCase = getIt<GetEventCommentsUseCase>();
  final GetBussinessCommentsUseCase _getBussinessCommentsUseCase = getIt<GetBussinessCommentsUseCase>();
  final DeleteCommentUseCase _deleteCommentUseCase = getIt<DeleteCommentUseCase>();
  final _commentPostUseCase = getIt<CommentPostUseCase>();
  final _commentEventUseCase = getIt<CommentEventUseCase>();
  final _commentBussinessUseCase = getIt<CommentBussinessUseCase>();

  List<CommentInterceptor> _comments = [];
  List<CommentInterceptor> get comments => _comments;

  String _currentUserId = "";
  String get currentUserId => _currentUserId;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  bool _showComments = false;
  bool get showComments => _showComments;

  String _commentContent = "";
  String get commentContent => _commentContent;

  bool _showAddComment = false;
  bool get showAddComment => _showAddComment;

  String onChangeCommentContent(String value) {
    return _commentContent = value;
  }

  Future<void> getAll(CommentSource source, String sourceId) async {

    await Future.wait([
      getCurrentUserId(),
      getComments(source, sourceId)
    ]);
    notifyListeners();

  }

  Future<void> getCurrentUserId() async {
    _currentUserId = await SecureStorage.getUserId() ?? "";
  }

  Future<void> getComments(CommentSource source, String sourceId) async {

    List<CommentInterceptor>? commentsG;

    switch(source) {
      case CommentSource.posts: 
        commentsG = await _getPostCommentsUseCase.run(sourceId);
        break;
      case CommentSource.event:
        commentsG = await _getEventCommentsUseCase.run(sourceId);
      case CommentSource.bussiness:
        commentsG = await _getBussinessCommentsUseCase.run(sourceId);
    }
    
    if(commentsG != null) {
      _comments = commentsG;
    }
  }

  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final res = await _getProfileUseCase.run(userId, token!);

    return res?.profilePhoto;
  }

  Future<void> saveComment(CommentSource source, String sourceId) async {

    final userId = await SecureStorage.getUserId();
    final commentDTO = CommentDto(
      userId: userId!, 
      content: _commentContent
    );

    _commentContent = "";
    _showAddComment = false;
    notifyListeners();

    late final dynamic comment;

    switch(source) {
      case CommentSource.posts :
        comment = await _commentPostUseCase.run(commentDTO, sourceId);
        break;
      case CommentSource.event :
        comment = await _commentEventUseCase.run(commentDTO, sourceId);
        break;

      case CommentSource.bussiness : 
        comment = await _commentBussinessUseCase.run(commentDTO, sourceId);
    }

    if(comment != null) {
      
      await getComments(source, sourceId);
      notifyListeners();
    }
    
  }

  Future<void> deleteComment(String commentId) async {
    final deletedId = await _deleteCommentUseCase.run(commentId);

    if(deletedId != null) {
      final filtered = _comments.where((c) => c.id != deletedId).toList();

      _comments = filtered;
      notifyListeners();
    }

  }

  void toggleShowComments() {
    _showComments = !_showComments;
    notifyListeners();
  }

  void toggleShowAddComment() {
    _showAddComment = !_showAddComment;
    notifyListeners();
  }



}
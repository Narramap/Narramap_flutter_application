
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/use_cases/delete_comment_use_case.dart';
import 'package:narramap/content/domain/use_cases/get_event_comments_use_case.dart';
import 'package:narramap/content/domain/use_cases/get_post_comments_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/presentation/widgets/comments_container.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class CommentContainerNotifier extends ChangeNotifier {

  final GetUserProfileUseCase _getProfileUseCase = getIt<GetUserProfileUseCase>();
  final GetPostCommentsUseCase _getPostCommentsUseCase = getIt<GetPostCommentsUseCase>();
  final GetEventCommentsUseCase _getEventCommentsUseCase = getIt<GetEventCommentsUseCase>();
  final DeleteCommentUseCase _deleteCommentUseCase = getIt<DeleteCommentUseCase>();

  List<CommentInterceptor> _comments = [];
  List<CommentInterceptor> get comments => _comments;

  String _currentUserId = "";
  String get currentUserId => _currentUserId;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  bool _showComments = false;
  bool get showComments => _showComments;

  Future<void> getAll(CommentSource source, String sourceId) async {

    await Future.wait([
      getCurrentUserId(),
      getComments(source, sourceId)
    ]);

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
        commentsG = [];
    }
    
    if(commentsG != null) {
      _comments = commentsG;
    }
  }

  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final res = await _getProfileUseCase.run(userId, token!);

    res?.profilePhoto;
  }

  Future<void> deleteComment(String commentId) async {
    final deletedId = await _deleteCommentUseCase.run(commentId);
  }

  void toggleShowComments() {
    _showComments = !_showComments;
    notifyListeners();
  }



}
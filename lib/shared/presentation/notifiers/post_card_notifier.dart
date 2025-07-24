
import 'package:flutter/widgets.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/use_cases/comment_post_use_case.dart';
import 'package:narramap/content/domain/use_cases/get_post_comments_use_case.dart';
import 'package:narramap/content/domain/use_cases/react_to_post_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/data/dto/comment_dto.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class PostCardNotifier extends ChangeNotifier {

  PostCardNotifier(String postId) {
    // getComments(postId);
  }

  final _getUserProfileUsecase = getIt<GetUserProfileUseCase>();
  final _reactToPostUseCase = getIt<ReactToPostUseCase>();
  final _getPostCommentsUseCase = getIt<GetPostCommentsUseCase>();
  final _commentPostUseCase = getIt<CommentPostUseCase>();

  String _commentContent = "";
  String get commentContent => _commentContent;

  bool _showComments = false;
  bool get showComments => _showComments;

  List<CommentInterceptor> _comments = [];
  List<CommentInterceptor> get comments => _comments;

  int _nComments = 0;
  int get nComments => _nComments;

  void toggleShowComments() {
    _showComments = !_showComments;
    notifyListeners();
  }

  void onChangeCommentContent(String value) {
    _commentContent = value;
  }

  Future<void> saveComment(String postId) async {

    final userId = await SecureStorage.getUserId();
    final commentDTO = CommentDto(
      userId: userId!, 
      content: _commentContent
    );
    final postComment = await _commentPostUseCase.run(commentDTO, postId);

    if(postComment != null) {
      _commentContent = "";
      getComments(postId);
    }
    
  }

  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final profile = await _getUserProfileUsecase.run(userId, token!);

    return profile?.profilePhoto;
  }

  Future<Post?> reactToPost(ReactionToPostDTO reactionDTO) async {
    return await _reactToPostUseCase.run(reactionDTO);
  }

  Future<void> getComments(String postId) async {
    final comments = await _getPostCommentsUseCase.run(postId);

    if(comments != null) {
      _comments = comments;
      _nComments = comments.length;
      notifyListeners();
    }
  } 


}
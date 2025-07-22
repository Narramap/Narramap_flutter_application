
import 'package:flutter/widgets.dart';
import 'package:narramap/content/domain/use_cases/comment_event_use_case.dart';
import 'package:narramap/content/domain/use_cases/get_event_comments_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/data/dto/comment_dto.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';

class EventCardNotifier extends ChangeNotifier {

  EventCardNotifier(String eventId) {
    getComments(eventId);
  }

  final _getUserProfileUsecase = getIt<GetUserProfileUseCase>();
  final _getEventCommentsUseCase = getIt<GetEventCommentsUseCase>();
  final _commentEventUseCase = getIt<CommentEventUseCase>();

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

  Future<void> saveComment(String eventId) async {

    final userId = await SecureStorage.getUserId();
    final commentDTO = CommentDto(
      userId: userId!, 
      content: _commentContent
    );
    final postComment = await _commentEventUseCase.run(commentDTO, eventId);

    if(postComment != null) {
      _commentContent = "";
      getComments(eventId);
    }
    
  }

  Future<String?> getUserPhoto(String userId) async {

    final token = await SecureStorage.getToken();
    final profile = await _getUserProfileUsecase.run(userId, token!);

    return profile?.profilePhoto;
  }

  Future<void> getComments(String eventId) async {
    final comments = await _getEventCommentsUseCase.run(eventId);

    if(comments != null) {
      _comments = comments;
      _nComments = comments.length;
      notifyListeners();
    }
  } 


}
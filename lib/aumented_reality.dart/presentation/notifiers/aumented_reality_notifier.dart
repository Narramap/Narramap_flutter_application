
import 'package:flutter/widgets.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/posts/domain/use_cases/get_all_posts_use_case.dart';

class AumentedRealityNotifier extends ChangeNotifier {

  final _getPostsUseCase = getIt<GetAllPostsUseCase>();

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future<void> getPosts() async {

    final gettedPosts = await _getPostsUseCase.run();
    if(gettedPosts != null) {
      _posts = gettedPosts;
      print("posts obtenidos");
    }

  }

}
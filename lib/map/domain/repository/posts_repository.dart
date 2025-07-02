import 'package:narramap/map/domain/model/post.dart';

abstract class PostsRepository {

  Future<List<Post>> getPosts();
}
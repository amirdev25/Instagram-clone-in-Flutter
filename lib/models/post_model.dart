import 'package:instagram/models/user_model.dart';

class PostModel {
  String imgUrl;
  String postContent;
  int likeCount;
  int commentCount;
  UserModel owner;

  PostModel(this.imgUrl, this.postContent, this.likeCount, this.commentCount,
      this.owner);
}

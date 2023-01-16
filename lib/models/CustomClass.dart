import 'package:instagram/models/post_model.dart';
import 'package:instagram/models/user_model.dart';

class CustomClass {
  Map<String, UserModel?> owner;
  Map<String, PostModel> postList;

  CustomClass(this.owner, this.postList);

}
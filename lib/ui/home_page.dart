import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: SvgPicture.asset("assets/icons/instagram.svg"),
        actions: const [
          Icon(
            Icons.add_circle_outline_outlined,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: 0,
        unselectedItemColor: Colors.black45,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken_sharp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  List<UserModel> userList = [];
  UserModel? owner;
  List<PostModel> postList = [];

  @override
  Widget build(BuildContext context) {
    loadData();
    return ListView(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? getOwnerAccount()
                        : getAccountWidget(
                            userList[index - 1],
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 540.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return getPostView(postList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  void loadData() {
    owner = UserModel(
      "Og'abek Tirkashov",
      "amirbek_developer",
      false,
      "https://images.unsplash.com/photo-1636041293723-abceb81bffbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGF2YXRhciUyMDF4MXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    );
    userList.add(UserModel(
      "Artur",
      "artur_t",
      true,
      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/flagged/photo-1573740144655-bbb6e88fb18a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1586297135537-94bc9ba060aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1605993439219-9d09d2020fa5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1563237023-b1e970526dcb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1599110906447-f38264a9c345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1599110906885-b024c90c2773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1599110364762-eba33ec21988?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));
    userList.add(UserModel(
      "Artur",
      "bek_tv",
      false,
      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ));

    postList.add(PostModel(
      "https://images.unsplash.com/photo-1664464168739-676285e4bf89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fGF2YXRhciUyMDF4MXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[0],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1673718859169-1c6c0f3a4651?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[1],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1673794784636-2e69436d3eee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[2],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[3],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1673715852601-987ac8f3b9ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[4],
    ));
    postList.add(PostModel(
      "https://plus.unsplash.com/premium_photo-1666184891956-6b607151bc3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[5],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1673799568508-658fb6773e4d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[6],
    ));
    postList.add(PostModel(
      "https://images.unsplash.com/photo-1673724562504-e52daa1c03bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[7],
    ));
    postList.add(PostModel(
      "hhttps://images.unsplash.com/photo-1673786427492-960fc4a0c1b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "The stack is a widget in Flutter that contains a list of widgets and positions them on top of the other. In other words, the stack allows developers to overlap multiple widgets into a single screen and renders them from bottom to top. Hence, the first widget is the bottommost item, and the last widget is the topmost item",
      645,
      16,
      userList[8],
    ));
  }

  Widget getAccountWidget(UserModel user) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 16.0,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 2.0,
                ),
                height: 64.0,
                width: 64.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: user.isLive
                          ? ([
                              Colors.blueAccent,
                              Colors.pink,
                            ])
                          : ([
                              Colors.pink,
                              Colors.red,
                            ]),
                    )),
                child: Container(
                    margin: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.imgUrl),
                        radius: 27.0,
                      ),
                    )),
              ),
              user.isLive
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.pink,
                              Colors.red,
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          )),
                      width: 32.0,
                      height: 16.0,
                      child: const Text(
                        "LIVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          Text(
            user.name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget getOwnerAccount() {
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 16.0,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 2.0,
                ),
                height: 64.0,
                width: 64.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 32.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(owner!.imgUrl),
                      radius: 26.0,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.add_circle,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const Text(
            "Your Story",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget getPostView(PostModel post) {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.owner.imgUrl),
                    radius: 20.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.owner.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        post.owner.userName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.black,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Image.network(post.imgUrl),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.heart_broken,
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.comment,
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.send,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.bookmark_border_outlined,
                size: 32.0,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 8.0,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "${post.likeCount} likes",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            left: 8.0,
            top: 8.0,
          ),
          child: RichText(
            text: TextSpan(
                text: post.owner.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: " ${post.postContent}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 8.0,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "View all ${post.commentCount} comments",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 8.0,
            top: 8.0,
            bottom: 4.0,
            right: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(owner!.imgUrl),
                    radius: 14.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    "Add a comment...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "❤   🙌",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                    size: 16.0,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            left: 8.0,
            bottom: 8.0,
          ),
          child: const Text(
            "11 hours ago",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
          ),
        )
      ],
    );
  }
}

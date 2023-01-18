import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/data/LocalData.dart';
import 'package:instagram/utils/Constants.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: SvgPicture.asset(
          "assets/icons/instagram.svg",
          color: Colors.black,
        ),
        actions: [
          SvgPicture.asset(
            "assets/icons/add.svg",
            color: Colors.black,
            height: 20.0,
            width: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              "assets/icons/chat.svg",
              color: Colors.black,
              height: 20.0,
              width: 20.0,
            ),
          )
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black45,
        selectedFontSize: 0.0,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/reels.svg",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/like.svg",
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1636041293723-abceb81bffbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGF2YXRhciUyMDF4MXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
              ),
              radius: 14.0,
            ),
            label: "",
          ),
        ],
        onTap: (index) {
          if (index == 4) {
            Navigator.pushNamed(
              context,
              Constants.PROFILE,
            );
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  LocalData data = LocalData();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.userList.length,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? getOwnerAccount()
                  : getAccountWidget(
                      data.userList[index - 1],
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
        SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < data.postList.length; i++)
                getPostView(data.postList[i]),
            ],
          ),
        )
      ],
    );
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
                      backgroundImage: NetworkImage(data.owner!.imgUrl),
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/like.svg",
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/share.svg",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/icons/bookmark.svg",
                color: Colors.black,
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
                    backgroundImage: NetworkImage(data.owner!.imgUrl),
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

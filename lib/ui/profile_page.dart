import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/data/LocalData.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalData data = LocalData();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          data.owner!.userName,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          SvgPicture.asset("assets/icons/add.svg"),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  ProfileBody({Key? key}) : super(key: key);
  LocalData data = LocalData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 38.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 37.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data.owner!.imgUrl),
                      radius: 34.0,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "14",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "325",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "102",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                data.owner!.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Personal blog",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                " - Full Stack Mobile developer\n - Student of TUIT",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(
                  Icons.link,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "www.t.me/AmirbekDeveloper/",
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
            Container(
              height: 56.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffe3e3e3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Professional dashboard",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "6.1K accounts reached in the last 30 days",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: getCustomView("EditProfile"),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: getCustomView("Contact"),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Story highlights",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Icon(Icons.keyboard_arrow_up_rounded),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Keep your favourites on your profile",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Text("New"),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  height: 64.0,
                  width: 64.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffd1d1d1),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  height: 64.0,
                  width: 64.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffd1d1d1),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  height: 64.0,
                  width: 64.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffd1d1d1),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.black,
                    tabs: [
                      const Icon(
                        Icons.apps,
                        color: Colors.black,
                      ),
                      SvgPicture.asset(
                        "assets/icons/reels.svg",
                        color: Colors.black,
                      ),
                      const Icon(
                        Icons.account_box_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 600.0,
                    child: TabBarView(
                      children: [
                        GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          children: [
                            for (int i = 0; i < data.postList.length; i++)
                              getPostItems(i),
                          ],
                        ),
                        Container(),
                        Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCustomView(String txt) {
    return Container(
      alignment: Alignment.center,
      height: 36.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffe3e3e3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        txt,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getPostItems(int i) {
    return Image.network(
      data.postList[i].imgUrl,
      fit: BoxFit.cover,
    );
  }
}

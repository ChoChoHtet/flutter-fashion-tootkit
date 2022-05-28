import 'package:flutter/material.dart';
import 'package:futter_fanshion_ui/colors.dart';
import 'package:futter_fanshion_ui/detail_page.dart';
import 'package:futter_fanshion_ui/item_size_view.dart';
import 'package:futter_fanshion_ui/recommend_item_view.dart';
import 'package:futter_fanshion_ui/recommend_vo.dart';

const kAnimationFadeIn = Duration(milliseconds: 1000);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool changeTheme = false;
  final List<RecommendVO> recommendItemList = [
    RecommendVO(
      name: "shoes",
      imgPath: "assets/images/high_heels.png",
      colors: kColorItem1,
      textColors: kColorItemText1,
    ),
    RecommendVO(
      name: "succulent",
      imgPath: "assets/images/succulent.png",
      colors: kColorItem2,
      textColors: kColorItemText2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: kAnimationFadeIn,
        builder: (context, double opacityValue, child) => Opacity(
          opacity: opacityValue,
          child: child,
        ),
        child: AnimatedContainer(
          duration: kAnimationDuration,
          color: changeTheme
              ? Colors.black
              : Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kAnimationFadeIn,
                child: ProfileSection(
                  changeTheme: changeTheme,
                  onTapNotification: () {
                    setState(() {
                      changeTheme = !changeTheme;
                    });
                  },
                ),
                builder: (context, double value, child) => Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: value * 64),
                    child: child,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kAnimationFadeIn,
                child: TrendForYouSection(
                  changeTheme: changeTheme,
                ),
                builder: (context, double value, childValue) => Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: 160, left: value * 16),
                    child: childValue,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: kAnimationFadeIn,
                  child: RecommendSection(
                    changeTheme: changeTheme,
                    recommendList: recommendItemList,
                  ),
                  builder: (context, double value, childValue) => Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: value * 120,
                        left: 16,
                        right: 16,
                      ),
                      child: childValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendSection extends StatelessWidget {
  const RecommendSection({
    Key? key,
    required this.changeTheme,
    required this.recommendList,
  }) : super(key: key);
  final bool changeTheme;
  final List<RecommendVO> recommendList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleAndIndicationView(
          changeTheme: changeTheme,
          title: "Recommended",
        ),
        const SizedBox(
          height: 30,
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: recommendList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailPage()),
                    );
                  },
                  child: RecommendItemView(
                    name: recommendList[index].name ?? "",
                    imgPath: recommendList[index].imgPath ?? "",
                    color: recommendList[index].colors ?? Colors.white,
                    textColor:
                        recommendList[index].textColors ?? Colors.black45,
                  ));
            },
          ),
        ),
      ],
    );
  }
}

class TrendForYouSection extends StatelessWidget {
  const TrendForYouSection({
    Key? key,
    required this.changeTheme,
  }) : super(key: key);
  final bool changeTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleAndIndicationView(
            changeTheme: changeTheme,
            title: "Trending for You",
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/model.jpeg",
                      width: 400,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "NEW 2020",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Modern Outfit\nCollection",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://static.toiimg.com/thumb/msid-84766434,imgsize-222150,width-800,height-600,resizemode-75/84766434.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Firna Surapt",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Icon(Icons.favorite_border_outlined,
                          size: 24, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAndIndicationView extends StatelessWidget {
  const TitleAndIndicationView({
    Key? key,
    required this.changeTheme,
    required this.title,
  }) : super(key: key);

  final bool changeTheme;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            color: changeTheme ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              BadgeAndIndicatorView(color: kColorItemDetail),
              SizedBox(
                width: 8,
              ),
              BadgeAndIndicatorView(color: Colors.black45),
            ],
          ),
        )
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.onTapNotification,
    required this.changeTheme,
  }) : super(key: key);
  final VoidCallback onTapNotification;
  final bool changeTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://static.toiimg.com/thumb/msid-84766434,imgsize-222150,width-800,height-600,resizemode-75/84766434.jpg"),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Howdy",
                style: TextStyle(
                  color: changeTheme ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Cristina Yota",
                style: TextStyle(
                  color: changeTheme ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              InkWell(
                onTap: onTapNotification,
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: changeTheme ? Colors.white : Colors.black45,
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                child: BadgeAndIndicatorView(
                  color: Colors.pinkAccent,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BadgeAndIndicatorView extends StatelessWidget {
  const BadgeAndIndicatorView({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
    );
  }
}

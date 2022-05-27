import 'package:flutter/material.dart';
import 'package:futter_fanshion_ui/explicit_collapse_animation.dart';
import 'package:futter_fanshion_ui/explicit_favorite_animation.dart';
import 'package:futter_fanshion_ui/item_size_view.dart';
import 'package:futter_fanshion_ui/size_vo.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool changeBackground = false;
  bool collapseText = false;
  final List<SizeVO> sizeList = [
    SizeVO(
      name: "S",
      isSelected: false,
    ),
    SizeVO(
      name: "M",
      isSelected: false,
    ),
    SizeVO(
      name: "L",
      isSelected: false,
    ),
    SizeVO(
      name: "XL",
      isSelected: false,
    ),
    SizeVO(
      name: "XXL",
      isSelected: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: 280,
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/model.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 16),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, right: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            ExplicitFavoriteAnimation(),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.share,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    )),
              )
            ]),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  const Text(
                    "OUTFIT IDEAS",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Modern Blue Jacket",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "\$ 19,39 ",
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Descriptions",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      ExplicitCollapseAnimation(onTapCollapse: (){
                        collapseText =!collapseText ;
                        setState((){
                        });

                      },)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedSize(
                    duration: kAnimationCollapse,
                    child: AnimatedContainer(
                      duration: kAnimationCollapse,
                      height: collapseText ? 0 : null,
                      child: const Text(
                        "You've just seen how to unit test a repository. In these next steps, you're going to again use dependency injection and create another test double—this time to show how to write unit and integration tests for your view models.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Size your size",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        "Size Guide",
                        style: TextStyle(
                            fontSize: 18, color: Colors.deepPurpleAccent),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizeList.length,
                        itemBuilder: (context, index) => ItemSizeView(
                            label: sizeList[index].name ?? "",
                            changeBackground:
                                sizeList[index].isSelected ?? false,
                            onTapSize: () {
                              sizeList[index].isSelected =
                                  !(sizeList[index].isSelected ?? false);
                              setState(() {});
                            })),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:futter_fanshion_ui/resources/colors.dart';
import 'package:futter_fanshion_ui/aniamtion/explicit_collapse_animation.dart';
import 'package:futter_fanshion_ui/aniamtion/explicit_favorite_animation.dart';
import 'package:futter_fanshion_ui/viewItems/item_size_view.dart';
import 'package:futter_fanshion_ui/vo/size_vo.dart';
import 'package:collection/collection.dart';

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
              const FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: OutfitCoverSection(),
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
            delegate: SliverChildListDelegate(
              [
                OutfitInfoSection(
                    collapseText: collapseText,
                    sizeList: sizeList,
                    onTapCollapse: () {
                      setState(() {
                        collapseText = !collapseText;
                      });
                    },
                    onTapSize: (index) {
                      setState(() {
                        sizeList[index].isSelected =
                            !(sizeList[index].isSelected ?? false);
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OutfitCoverSection extends StatelessWidget {
  const OutfitCoverSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class OutfitInfoSection extends StatelessWidget {
  const OutfitInfoSection({
    Key? key,
    required this.collapseText,
    required this.sizeList,
    required this.onTapCollapse,
    required this.onTapSize,
  }) : super(key: key);
  final VoidCallback onTapCollapse;
  final Function(int) onTapSize;
  final bool collapseText;
  final List<SizeVO> sizeList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
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
            style: TextStyle(fontSize: 18, color: kColorItemDetail),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                "Descriptions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              ExplicitCollapseAnimation(
                onTapCollapse: () {
                  onTapCollapse();
                },
              )
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
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              Text(
                "Size your size",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "Size Guide",
                style: TextStyle(fontSize: 18, color: kColorItemDetail),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: sizeList
                .mapIndexed((index, e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ItemSizeView(
                          label: e.name ?? "",
                          changeBackground: e.isSelected ?? false,
                          onTapSize: () => onTapSize(index),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

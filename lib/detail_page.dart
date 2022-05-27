import 'package:flutter/material.dart';
import 'package:futter_fanshion_ui/item_size_view.dart';

class DetailPage extends StatelessWidget {
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
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 16),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
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
                            Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
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
                children:  [
                  const Text(
                    "OUTFIT IDEAS",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Modern Blue Jacket",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "\$ 19,39 ",
                    style: TextStyle(fontSize: 18,color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text(
                        "Descriptions",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_up_outlined,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child:  const Text(
                      "You've just seen how to unit test a repository. In these next steps, you're going to again use dependency injection and create another test double—this time to show how to write unit and integration tests for your view models.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text(
                        "Size your size",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      const Text(
                        "Size Guide",
                        style: TextStyle(fontSize: 18 , color: Colors.deepPurpleAccent),
                      )
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Wrap(
                    children: [
                      ItemSizeView(label: "S"),
                      SizedBox(width: 10,),
                      ItemSizeView(label: "M"),
                      SizedBox(width: 10,),
                      ItemSizeView(label: "L"),
                      SizedBox(width: 10,),
                      ItemSizeView(label: "XL"),
                      SizedBox(width: 10,),
                      ItemSizeView(label: "XXL"),
                      SizedBox(width: 10,),
                    ],
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

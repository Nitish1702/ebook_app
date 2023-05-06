import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ebook_app/App_Tab.dart';
import 'Tab_view.dart';
void main() {
  runApp( MyApp());
}

 
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  List images = [];

  ScrollController _controller=ScrollController();
  late TabController _tabController;
  readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/popular_books.json')
        .then((s) {
      // print(s);
      setState(() {
        images = jsonDecode(s);
        // print('hi');
      });
      print(images);
    });
  }
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
    readData();
    print(images);

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(images);
    // List<String> images=["img/img_0.png","img/img_1.png","img/img_2.png","img/img_3.png","img/img_4.png"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8, right: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.window),
                      onPressed: () {},
                      alignment: Alignment.centerLeft,),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                          alignment: Alignment.centerRight,),
                        IconButton(
                          icon: Icon(Icons.notifications_active_rounded),
                          onPressed: () {},
                          alignment: Alignment.centerRight,),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child:
                Text('Popular Books',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),),
              ),
              Container(
                height: 180,
                child:
                PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: images.length,
                    itemBuilder: (_, i) {
                      return Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(images[i]["image"]),
                              fit: BoxFit.fill
                          ),
                        ),

                      );
                    }),
              ),
              Expanded(child: NestedScrollView(
                  controller:_controller,
                    headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [SliverAppBar(
                      pinned: true,
                      backgroundColor: Colors.white,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child:Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38,
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 7,
                                offset:Offset (0,0)
                            )]
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.only(right:8),
                          indicatorPadding: const EdgeInsets.all(8),
                          controller: _tabController,
                          isScrollable: true,
                          tabs: [
                            App_Tab(text: "New", color: Colors.red),
                            App_Tab(text: "Popular", color: Colors.blue),
                            App_Tab(text: "Trending", color: Colors.green),


                          ],
                        ),
                        )
                      ),
                    )
                    ];
                  },
              body:TabBarView(
                controller: _tabController,
                  children: [
                    Tab_View(images),
                    Tab_View(images),
                    Tab_View(images),

                  ],

              )


              )
              )
            ],
          ),
        ),
      ),
    );
  }
}











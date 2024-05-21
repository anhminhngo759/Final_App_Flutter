import 'package:flutter/material.dart';

import '../components/app_elevent_button.dart';
import '../components/arrival_item_row.dart';
import '../components/category_cell.dart';
import '../components/line_text_field.dart';
import '../components/selection_text_view.dart';
import '../components/shoes_item_cell.dart';
import '../resources/app_color.dart';
import 'search_location_page.dart';
import 'shoes_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelectCity = false;
  TextEditingController txtSearch = TextEditingController();

  List catArr = [
    {"image": "assets/images/nike.png", "name": "Nike"},
    {"image": "assets/images/puma.png", "name": "Puma"},
    {"image": "assets/images/adidas.png", "name": "Adidas"},
    {"image": "assets/images/converse.png", "name": "Converse"},
  ];

  List popularArr = [
    {
      "name": "Nike Jordan",
      "price": "\$300",
      "category": "Pizza, Italian",
      "image": "assets/images/t1.jpg"
    },
    {
      "name": "Nike Air Max",
      "price": "\$300",
      "category": "Sushi, Japan",
      "image": "assets/images/l1.png"
    },
    {
      "name": "Nike Air Jordan",
      "price": "\$300",
      "category": "Steak, American",
      "image": "assets/images/t3.png"
    }
  ];

  List arrivalArr = [
    {
      "name": "Nike Jordan",
      "price": "\$300",
      "category": "Pizza, Italian",
      "image": "assets/images/arr1.png"
    },
    {
      "name": "Nike Air Max",
      "price": "\$300",
      "category": "Sushi, Japan",
      "image": "assets/images/arr2.png"
    },
    {
      "name": "Nike Air Jordan",
      "price": "\$300",
      "category": "Steak, American",
      "image": "assets/images/arr12.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: isSelectCity
          ? NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    pinned: true,
                    floating: false,
                    centerTitle: false,
                    leading: IconButton(
                      icon: Image.asset(
                        "assets/images/back.png",
                        width: 24,
                        height: 30,
                        color: AppColor.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          isSelectCity = false;
                        });
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ha Noi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Your location",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColor.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        icon: Image.asset(
                          "assets/images/notification.png",
                          width: 24,
                          height: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectCity = false;
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const MyOrderView()));
                        },
                        icon: Image.asset(
                          "assets/images/shopping_cart.png",
                          width: 25,
                          height: 25,
                        ),
                      ),

                      // IconButton(
                      //   icon: Image.asset(
                      //     "assets/images/add.png",
                      //     width: 24,
                      //     height: 30,
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       isSelectCity = false;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                  SliverAppBar(
                    backgroundColor: AppColor.white,
                    elevation: 0,
                    pinned: false,
                    floating: true,
                    primary: false,
                    title: RoundTextField(
                      controller: txtSearch,
                      hitText: "Search for shoes…",
                      leftIcon: Icon(Icons.search, color: AppColor.grey),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.width * 0.20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          itemCount: catArr.length,
                          itemBuilder: (context, index) {
                            var cObj = catArr[index] as Map? ?? {};

                            return CategoryCell(
                              cObj: cObj,
                            );
                          }),
                    ),
                    SelectionTextView(
                      title: "Popular Shoes",
                      onSeeAllTap: () {},
                    ),
                    SizedBox(
                      height: media.width * 0.47,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: popularArr.length,
                          itemBuilder: (context, index) {
                            var sObj = popularArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoesDetailPage(sObj: sObj)),
                                );
                              },
                              child: ShoesItemCell(
                                sObj: sObj,
                              ),
                            );
                            // return ShoesItemCell(
                            //   sObj: sObj,
                            // );
                          }),
                    ),
                    SelectionTextView(
                      title: "New Arrival",
                      onSeeAllTap: () {},
                    ),
                    ListView.builder(
                        // scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: arrivalArr.length,
                        itemBuilder: (context, index) {
                          var aObj = arrivalArr[index] as Map? ?? {};

                          return ArrivalItemRow(
                            aObj: aObj,
                            onTap: () {},
                          );
                        }),
                  ],
                ),
              ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/home_page_icon.png",
                  width: media.width,
                  height: media.width * .25,
                  color: AppColor.blue,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const Text(
                  "Hi, nice to meet you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const Text(
                  "Set your location to start searching\n stores close to you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: AppEleventButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SearchLocationPage()));
                        setState(() {
                          isSelectCity = true;
                        });
                      },
                      text: "User current location",
                      colorBorder: AppColor.blue),
                ),
              ],
            ),
    );
    ;
  }
}

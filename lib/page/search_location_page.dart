import 'package:final_app_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';
import '../components/line_text_field.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  TextEditingController txtSearch = TextEditingController();

  List recentlyArr = [
    {
      "name": "Viet Nam",
      "emoji": "🇻🇳",
      "city": [
        {"name": "Ha Noi"},
        {"name": "Da Nang"},
        {"name": "Ho Chi Minh"},
        {"name": "Hai Phong"},
        {"name": "Dong Thap"}
      ]
    },
    {"name": "Australia", "emoji": "🇦🇺"},
    {"name": "France", "emoji": "🇫🇷"},
    {"name": "Brazil", "emoji": "🇧🇷"},
    {"name": "Canada", "emoji": "🇨🇦"},
    {"name": "Japan", "emoji": "🇯🇵"}
  ];

  List searchResultArr = [
    {
      "name": "Viet Nam",
      "emoji": "🇻🇳",
      "city": [
        {"name": "Ha Noi"},
        {"name": "Da Nang"},
        {"name": "Ho Chi Minh"},
        {"name": "Hai Phong"},
        {"name": "Dong Thap"}
      ]
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    txtSearch.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/back.png",
            width: 24,
            height: 30,
            color: AppColor.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
            // endEditing();
          },
        ),
        title: const Text(
          "User current location",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineTextField(
            controller: txtSearch,
            hitText: "Search the city...",
            isClear: true,
            onClearPressed: () {
              setState(() {
                txtSearch.text = "";
              });
            },
          ),
          SizedBox(
            height: media.width * 0.04,
          ),
          if (txtSearch.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Recently city location",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (txtSearch.text.isEmpty)
            Expanded(
              child: ListView.builder(
                  itemCount: recentlyArr.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  itemBuilder: (context, index) {
                    var rObj = recentlyArr[index] as Map? ?? {};
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            rObj["emoji"].toString(),
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              rObj["name"].toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                  itemCount: searchResultArr.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  itemBuilder: (context, index) {
                    var rObj = recentlyArr[index] as Map? ?? {};
                    var cArr = rObj["city"] as List? ?? [];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColor.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                rObj["emoji"].toString(),
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  rObj["name"].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: AppColor.grey,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: cArr.map((cObj) {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColor.grey, width: 0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cObj["name"].toString(),
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: AppColor.grey,
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }),
            ),
        ],
      ),
    );
  }
}

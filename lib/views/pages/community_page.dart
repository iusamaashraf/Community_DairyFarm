import 'package:community_dairy_farm/models/community_model.dart';
import 'package:community_dairy_farm/models/data.dart';
import 'package:community_dairy_farm/views/pages/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          title: Text(
            'Community',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox.expand(
                child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: communityList.length,
                itemBuilder: (BuildContext context, int index) {
                  final CommunityModel showData = communityList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => VideosPage(modelData: showData));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(showData.imageAsset),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(showData.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.black))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ))));
  }
}

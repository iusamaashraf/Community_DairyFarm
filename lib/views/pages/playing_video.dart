import 'package:community_dairy_farm/constants/size_config.dart';
import 'package:community_dairy_farm/models/community_model.dart';
import 'package:community_dairy_farm/models/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    Key key,
    this.playVideoData,
  }) : super(key: key);

  final CommunityModel playVideoData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox.expand(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    playVideoData.imageAsset,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(playVideoData.videotitle,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.black)),
          ),
          SizedBox(height: 3 * SizeConfig.heightMultiplier),
          Expanded(
            child: ListView.builder(
              itemCount: communityList.length,
              itemBuilder: (BuildContext context, int index) {
                final CommunityModel suggestedVideo = communityList[index];
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      height: 7 * SizeConfig.heightMultiplier,
                      width: 25 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(suggestedVideo.imageAsset),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(suggestedVideo.videotitle,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: Colors.black)),
                        Text(suggestedVideo.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Colors.grey))
                      ],
                    )
                  ],
                );
              },
            ),
          )
        ],
      ))),
    );
  }
}

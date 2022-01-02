import 'package:community_dairy_farm/constants/size_config.dart';
import 'package:community_dairy_farm/models/community_model.dart';
import 'package:community_dairy_farm/models/data.dart';
import 'package:community_dairy_farm/views/pages/playing_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({
    Key? key,
    required this.modelData,
  }) : super(key: key);

  final CommunityModel modelData;

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
        // title: Text(
        //   'Channels',
        //   style: Theme.of(context)
        //       .textTheme
        //       .subtitle1!
        //       .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        // ),
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Here is the short profile of artist forexample number of videos name and profile
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3 * SizeConfig.widthMultiplier),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(modelData.imageAsset),
                        ),
                        const SizedBox(height: 5),
                        // const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(modelData.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.black)),
                        ),
                        const SizedBox(height: 5),
                        Text('88 videos',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.black)),
                      ],
                    )),
                const SizedBox(height: 10),
                //Here we show videos of that artist
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: communityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CommunityModel showVideos = communityList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PlayVideo(
                              playVideoData: showVideos,
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 25 * SizeConfig.heightMultiplier,
                            width: 100 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    showVideos.imageAsset,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3 * SizeConfig.widthMultiplier,
                                vertical: 2 * SizeConfig.heightMultiplier),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage(showVideos.imageAsset),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(showVideos.videotitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

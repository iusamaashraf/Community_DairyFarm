import 'package:community_dairy_farm/views/pages/community_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/size_config.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              theme: ThemeData(
                colorScheme: const ColorScheme.light(),
                fontFamily: 'avenir',
              ),
              debugShowCheckedModeBanner: false,
              home: const CommunityPage(),
            );
          },
        );
      },
    );
  }
}

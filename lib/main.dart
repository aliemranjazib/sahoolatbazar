import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sahoolar_bazar/adminside/update/maincategory.dart';
import 'package:sahoolar_bazar/userpages/homepage.dart';
import 'package:sahoolar_bazar/userpages/productspages/sub_category_prpducts.dart';
import 'package:sahoolar_bazar/userpages/profile_page.dart';
import 'package:sahoolar_bazar/userpages/splashScreen.dart';

import 'adminside/adminmainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins-Regular',
        ),
        home: SplashInitPage(),
        routes: {
          HomePage.id: (_) => HomePage(),
        },
      ),
    );
  }
}

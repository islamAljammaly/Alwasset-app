import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/pages.dart';

import 'features/home/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage().initStorage();
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: false);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AL Waseet',
          initialBinding: BindingHome(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('en'),
          navigatorKey: Get.key,
          localeResolutionCallback: (locale, supportedLocales) {
            // تحديد اللغة المدعومة في حالة عدم وجود اللغة المحددة
            if (locale == null) {
              return supportedLocales.first;
            }
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          initialRoute: AppRouting.splashview,
          getPages: pages,
        );
      },
    );
  }
}

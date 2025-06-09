import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'app/core/core.dart';
import 'app/routes/app_pages.dart';
import 'binding/app_binding.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that we can use FlutterSecureStorage
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the FlutterSecureStorage
  const storage = FlutterSecureStorage();
  // Read the token from secure storage
  String? _key = await storage.read(key: MyConstants.token);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: R.color.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          title: AppConfig.appName,
          initialBinding: AppBinding(), // 🔥 inject singleton(s)
          //Localization
          translations: MyAppTranslation(),
          locale: AppConfig.defaultLocale,
          fallbackLocale: AppConfig.defaultLocale,
          supportedLocales: MyAppTranslation.supportedLocales,
          //theme
          themeMode: AppConfig.appDefaultTheme,
          theme: R.theme.light,
          darkTheme: R.theme.dark,
          //end
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}

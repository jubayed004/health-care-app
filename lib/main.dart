import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:template_flutter/share/controller/get_controllers.dart';
import 'core/di/getx_injection.dart';
import 'core/di/injection.dart';
import 'core/router/routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'helper/device_utils/device_utils.dart';
import 'share/controller/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  initGetx();
  initDependencies();

  //Localization
  Map<String, Map<String, String>>? languages = await LanguageController.getLanguages();

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,this.languages});

  final Map<String, Map<String, String>>? languages;

  @override
  Widget build(BuildContext context) => GetBuilder<LanguageController>(
    init: GetControllers.instance.getLanguageController(),
    builder: (localizeController) => ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,

        //Route Section
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,
        //Theme Section
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        //Languages Section
        locale: localizeController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: const Locale("es", "ES"),
      ),
    ),
  );
}

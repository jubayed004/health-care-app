import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/core/custom_assets/assets.gen.dart';
import 'package:template_flutter/core/di/injection.dart';
import 'package:template_flutter/core/router/routes.dart';
import 'package:template_flutter/core/service/datasource/local/local_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:template_flutter/share/widgets/custom_text/custom_text.dart';
import 'package:template_flutter/share/widgets/button/custom_button.dart';
import 'package:template_flutter/share/widgets/text_field/custom_text_field.dart';
import 'package:template_flutter/share/widgets/text_field/custom_text_field_one.dart';
import 'package:template_flutter/utils/color/app_colors.dart';

import '../../core/router/route_path.dart';
import '../../helper/validator/text_field_validator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalService localService = sl();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final token = await localService.getToken();
    final role = await localService.getRole();

    Future.delayed(Duration(seconds: 2), () {
      if (token.isNotEmpty && !JwtDecoder.isExpired(token)) {
        if (role == "USER") {
   /*       // Navigate to user-specific page
          Navigator.pushReplacementNamed(context, RoutePath.navigationPage);*/
        } else {
/*          // Navigate to business page
          Navigator.pushReplacementNamed(context, RoutePath.businessNavigationPage);*/
        }
      } else {
/*        // Navigate to onboarding screen
        Navigator.pushReplacementNamed(context, RoutePath.onboardingScreen);*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              isPrefixIcon: true,
              prefixIcon: Icon(Icons.password),
              isPassword: true,
              title: "Password",
              fillColor: Colors.white,
              hintText: "Enter Your PassWord",
              keyboardType: TextInputType.emailAddress,
              fieldBorderRadius: 10.r,
              fieldBorderColor: AppColors.primaryColor,
              validator: TextFieldValidator.password(),
            ),
          ],
        ),
      ),
    );
  }
}

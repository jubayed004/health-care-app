import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template_flutter/core/custom_assets/assets.gen.dart';
import 'package:template_flutter/core/di/injection.dart';
import 'package:template_flutter/core/service/datasource/local/local_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:template_flutter/share/widgets/custom_text/custom_text.dart';
import 'package:template_flutter/share/widgets/text_field/custom_text_field.dart';
import 'package:template_flutter/share/widgets/text_field/custom_text_field_one.dart';
import 'package:template_flutter/utils/color/app_colors.dart';
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
  String selectedOption = "User";

  void handleSelection(String option) {
    setState(() {
      selectedOption = option;
    });
  }
  String selectedLanguage = "English";

  void handleLanguageChange(int index) {
    setState(() {
      selectedLanguage = index == 0 ? "English" : "Greek";
    });
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
    final List<Map<String, String>> medications = [
      {
        'name': 'Paracetamol',
        'dosage': '500mg',
        'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': 'Taken at 11:00 AM Today Nov 6',
      },
      {
        'name': 'Aspirin',
        'dosage': '300mg',
        'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': 'Taken at 2:00 PM Today Nov 7',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("All Component",style: Theme.of(context).textTheme.titleLarge,)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             /*   CustomTextField(
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
                ),*/
                CustomTextField(
                  prefixIcon: Icon(Icons.password,),
                  isPassword: true,
                  title: "Password",
                  hintText: "Enter Your PassWord",
                  keyboardType: TextInputType.emailAddress,
                  validator: TextFieldValidator.password(),
                ),
                Gap(4),
                CustomContainer(
                  onTap: (){},
                  icon: Icons.ice_skating,
                  text: "Ambulances",
                  textColor: Colors.black,
                  bgColor: AppColors.blueColor700,
                  subContainerColor: AppColors.primaryColor,
                  borderRadius: true,
                  borderColor: AppColors.primaryColor,
                ),
                SettingItem(
                  title: "Account Settings",
                  icon: Icons.settings,
                  onTap: () {
                    // Handle account settings action
                    print("Account Settings tapped");
                  },
                ),
             ...List.generate(medications.length, (index)=>
                 MedicationCard(
                   medicationName: medications[index]['name']!,
                   dosage: medications[index]['dosage']!,
                   description: medications[index]['description']!,
                   timeTaken: medications[index]['time']!,
                   onDelete: () {
                     // Handle delete action
                     print("Delete: ${medications[index]['name']}");
                   },
                   onEdit: () {
                     // Handle edit action
                     print("Edit: ${medications[index]['name']}");
                   },
                 ),
              ),
        
                UserProviderCard(
                  title: "User",
                  icon: Icons.person,
                  onTap: () => handleSelection("User"),
                  isSelected: selectedOption == "User",
                ),
                UserProviderCard(
                  title: "Provider",
                  icon: Icons.medical_services,
                  onTap: () => handleSelection("Provider"),
                  isSelected: selectedOption == "Provider",
                ),
        
                Text(
                  "Selected Language: $selectedLanguage",
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(height: 20.h),
                LanguageToggle(),
                EmergencyCard()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? subContainerColor;
  final Color? borderColor;
  final bool? borderRadius ;


  const CustomContainer({super.key,
    this.icon,
    this.text,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.subContainerColor,
     this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border:BoxBorder.all(color: borderColor ?? Colors.white,width: 1)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: subContainerColor,
                shape: BoxShape.rectangle,
                borderRadius:borderRadius == false ? BorderRadius.circular(6):BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).brightness == Brightness.light? Theme.of(context).iconTheme.color: Colors.cyan
              ),
            ),
            SizedBox(width: 10),
            Text(
              text ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
class MedicationCard extends StatelessWidget {
  final String medicationName;
  final String dosage;
  final String description;
  final String timeTaken;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const MedicationCard({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.description,
    required this.timeTaken,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFF1D4D4F), // Teal background color
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicationName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  dosage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  timeTaken,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: onDelete, // Pass delete callback
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              IconButton(
                onPressed: onEdit, // Pass edit callback
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color(0xFF00B0B9), // Light teal color
              size: 24.sp,
            ),
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF00B0B9), // Light teal color for the arrow
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
class UserProviderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const UserProviderCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF00B0B9) : Colors.white, // Change color based on selection
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Color(0xFF00B0B9), // Border color
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Color(0xFF00B0B9), // Icon color change based on selection
              size: 24.sp,
            ),
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Color(0xFF00B0B9), // Text color change based on selection
              ),
            ),
            if (!isSelected) ...[
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF00B0B9),
                size: 18.sp,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  _LanguageToggleState createState() => _LanguageToggleState();
}
class _LanguageToggleState extends State<LanguageToggle> {
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEnglish = !_isEnglish;
        });
      },
      child: Container(
        width: 200, // Width of the toggle
        height: 50, // Height of the toggle
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: _isEnglish ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            AnimatedAlign(
              alignment: _isEnglish ? Alignment.centerLeft : Alignment.centerRight,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Text(
                    _isEnglish ? 'English' : 'Greek',
                    style: TextStyle(
                      color:   _isEnglish?Colors.black:Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class EmergencyCard extends StatelessWidget {
  const EmergencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red, // Red color background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Icon with Title
            Row(
              children: [
                Assets.icons.emergency.svg(),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency Need',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Description Text
                   CustomText(text: 'Immediate connection with emergency services',
                     color: Colors.white70,
                     fontSize: 14,
                   fontWeight: FontWeight.w400,
                   maxLines: 3,
                     overflow: TextOverflow.ellipsis,
                     textAlign: TextAlign.start,
                   )
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            // Emergency Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Emergency button press here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black button background
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning_amber_outlined, size: 20,color: Colors.white,),
                    SizedBox(width: 8),
                    Text(
                      'Emergency',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
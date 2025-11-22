import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter/core/custom_assets/fonts.gen.dart';
import 'package:template_flutter/share/widgets/loading/loading_widget.dart';
import 'package:template_flutter/utils/color/app_colors.dart';
import 'package:template_flutter/utils/extension/base_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;

  const CustomButton({
    required this.text,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.whiteColor : AppColors.primaryColor;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    if (isLoading) {
      return const LoadingWidget(color: AppColors.whiteColor,);
    } else {
      return Text(
        text,
        style: context.titleMedium.copyWith(color: AppColors.whiteColor),
      );
    }
  }
}



class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final double? elevation;

  const CustomElevatedButton({super.key,
    required this.label,
    required this.color,
    required this.textColor,
          this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (kDebugMode) {
          print('$label button pressed!');
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color, // Text color
      /*  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Padding*/
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
 /*         side: BorderSide(color: Colors.black,width: 1)// Rounded corners*/
        ),
        elevation: elevation, // Elevation
  /*      shadowColor: Colors.black.withValues(alpha: 0.2), // S*/
      ),
      child: Text(
        label, // Button text
        style: TextStyle(
          fontFamily: FontFamily.extraBold,
          fontSize: 14, // Font size
          fontWeight: FontWeight.w500, // Text weight
        ),
      ),
    );
  }
}
class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color textColor;
  final double elevation;

  const CustomOutlinedButton({super.key,
    required this.label,
    required this.borderColor,
    required this.textColor,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Action when the button is pressed
        print('$label button pressed!');
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 1), // Border color and thickness
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        elevation: elevation, // Elevation (not always visible for OutlinedButton)
      ),
      child: Text(
        label, // Button text
        style: TextStyle(
          fontSize: 14, // Font size
          fontWeight: FontWeight.w700, // Text weight
          color: textColor, // Text color
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:template_flutter/utils/color/app_colors.dart';

enum AppDialogType { info, success, warning, error, custom }

class AppDialog {
  static Future<Object?> show({
    required BuildContext context,
    String? title,
    String? subtitle,
    AppDialogType type = AppDialogType.info,
    Widget? icon,
    bool dismissible = true,
    bool showDefaultButtons = false,
    String confirmText = "OK",
    String cancelText = "Cancel",
    Color? confirmTextCancelTextColor,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    List<Widget>? actions,
    Color? backgroundColor,
    Color? titleColor,
    Color? subtitleColor,
    double borderRadius = 14,
    Duration transitionDuration = const Duration(milliseconds: 350),
    Curve curve = Curves.easeOutBack,
    Curve reverseCurve = Curves.easeInCubic,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    double maxWidth = 380,
  }) {
    IconData defaultIcon;
    Color typeColor;

    switch (type) {
      case AppDialogType.success:
        defaultIcon = Icons.check_circle;
        typeColor = AppColors.primaryColor;
        break;
      case AppDialogType.error:
        defaultIcon = Icons.error;
        typeColor = Colors.red.shade600;
        break;
      case AppDialogType.warning:
        defaultIcon = Icons.warning_amber_rounded;
        typeColor = Colors.orange.shade700;
        break;
      case AppDialogType.info:
        defaultIcon = Icons.info_outline;
        typeColor = Colors.blue.shade600;
        break;
      case AppDialogType.custom:
        defaultIcon = Icons.circle;
        typeColor = AppColors.brandHoverColor;
        break;
    }

    List<Widget> defaultButtons = [];
    if (showDefaultButtons) {
      if (onCancel != null) {
        defaultButtons.add(
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
              onCancel();
            },
            child: Text(cancelText,style: TextStyle(color: confirmTextCancelTextColor),),
          ),
        );
      }
      defaultButtons.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: typeColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            Navigator.pop(context, true);
            if (onConfirm != null) onConfirm();
          },
          child: Text(confirmText,style: TextStyle(color: confirmTextCancelTextColor),),
        ),
      );
    }

    return showGeneralDialog(
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: transitionDuration,
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, _) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
          reverseCurve: reverseCurve,
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: curvedAnimation,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                  backgroundColor: backgroundColor ?? AppColors.whiteColor,
                  elevation: 10,
                  child: Padding(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null || type != AppDialogType.custom)
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: typeColor.withValues(alpha: 0.15),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: icon ?? Icon(defaultIcon, color: typeColor, size: 38),
                          ),
                        if (title?.isNotEmpty ?? false)
                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: titleColor ?? AppColors.blackColor,
                            ),
                          ),
                        if (subtitle?.isNotEmpty ?? false)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              subtitle!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: subtitleColor ?? AppColors.whiteColor,
                              ),
                            ),
                          ),
                        if ((actions?.isNotEmpty ?? false) || showDefaultButtons)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: actions ?? defaultButtons,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

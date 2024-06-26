import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback ?onTap;
  final WidgetStateProperty<EdgeInsets?>? padding;
  final WidgetStateProperty<Color?>?  backgroundColor;
  final WidgetStateProperty<Color?>?  foregroundColor;
  const CustomButton({super.key, required this.title, this.backgroundColor, this.onTap, this.foregroundColor, this.padding});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        padding: padding,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(title, style: AppStyles.styleSemiBold20(context)),
    );
  }
}
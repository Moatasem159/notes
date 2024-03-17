import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback ?onTap;
  final MaterialStateProperty<Color?>?  backgroundColor;
  final MaterialStateProperty<Color?>?  foregroundColor;
  const CustomButton({super.key, required this.title, this.backgroundColor, this.onTap, this.foregroundColor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(title, style: AppStyles.styleSemiBold20(context)),
    );
  }
}
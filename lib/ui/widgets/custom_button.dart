import 'package:evently/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundcolor;
  final String text;
  final Function() onClick;
  final Color textColor;
  final Image? image;

  const CustomButton({
    super.key,
    this.backgroundcolor = AppColors.purple,
    required this.text,
    required this.onClick,
    this.textColor = Colors.white,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.purple, width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[image!, const SizedBox(width: 8)],
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/size_screen_extension.dart';

class CustomElevatedButton extends StatelessWidget {

final String text;

  const CustomElevatedButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

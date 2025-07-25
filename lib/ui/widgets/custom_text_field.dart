import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? prefixIcon;
  final bool isPassword;
  final int minLines;

  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.minLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon == null
            ? null
            : Image.asset(widget.prefixIcon!, height: 24, width: 24),

        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                ),
              )
            : null,
        hintText: widget.hint,
      ),
      minLines: widget.minLines,
      maxLines: widget.minLines + 1,
      obscureText: widget.isPassword ? obscureText : false,
    );
  }
}

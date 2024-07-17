import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.color,
    this.validator,
    this.maxLines,
    required this.hintText,
  });

  final TextEditingController controller;
  final MonixColors color;
  final int? maxLines;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: widget.controller,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: widget.color.secondary,
          decoration: TextDecoration.none),
      autocorrect: false,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      cursorColor: widget.color.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.w),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: widget.color.hintText,
        ),
        filled: true,

        fillColor: widget.color.lightPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14.w,
          ),
          borderSide: BorderSide.none,
        ),
        // enabledBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
      ),
    );
  }
}

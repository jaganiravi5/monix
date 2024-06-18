import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.color,
    this.maxLines, required this.hintText,
  });

  final TextEditingController controller;
  final MonixColors color;
  final int? maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w400, color: color.secondary, decoration: TextDecoration.none),
      autocorrect: false,
      maxLines: maxLines ?? 1,
      textInputAction: TextInputAction.next,
      cursorColor: color.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.w),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: color.hintText,
        ),
        filled: true,
        fillColor: color.lightPrimary,
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

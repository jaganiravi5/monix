import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monix_assets/monix_assets.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function() onSearchTap;
  final Function() onClear;
  final Function(String) onChanged;

  const SearchBarField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSearchTap,
    required this.onClear,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Consumer(
      builder: (context, ref, child) => TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: color.secondary, decoration: TextDecoration.none),
        autocorrect: false,
        textInputAction: TextInputAction.search,
        onEditingComplete: () => onSearchTap(),
        onChanged: (value) => onChanged(value),
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
          prefixIcon: InkWell(
            // onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                top: 16.w,
                bottom: 16.w,
                right: 10.w,
              ),
              child: icons.search.svg(
                color: color.hintText,
                width: 22.w,
                height: 22.w,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ref.watch(searchTextProvider).isNotEmpty
                  ? GestureDetector(
                      onTap: () => onClear(),
                      child: Icon(
                        Icons.close_rounded,
                        color: color.secondary1,
                      ),
                    )
                  : const SizedBox.shrink(),
              // IconButton(
              //   onPressed: () => onSearchTap(),
              //   icon: icons.search.svg(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

final searchTextProvider = StateProvider<String>((ref) => "");

final tempLoadingProvider = StateProvider<bool>((ref) => true);

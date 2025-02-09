import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';

// ignore: must_be_immutable
class DropDownButtonProvider extends StatefulWidget {
  DropDownButtonProvider(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.selectItem,
      required this.iconData,
      required this.onchanged});
  List<String> items;
  final String selectItem;
  Widget iconData;
  final void Function(String?) onchanged;
  String? selectedValue;
  @override
  State<DropDownButtonProvider> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonProvider> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 40.h,
        padding: EdgeInsets.only(left: 8.w, right: 2.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9FA),
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
        ),
        child: DropdownButton2(
          isExpanded: true,
          iconStyleData: IconStyleData(icon: widget.iconData),
          hint: MyTextStyleTrajanPro(
            text: widget.selectItem,
            size: 13.sp,
            color: const Color.fromARGB(255, 62, 61, 61),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: MyTextStyleTrajanPro(
                      text: item,
                      size: 12.sp,
                      color: AppColors.black,
                    ),
                  ))
              .toList(),
          value: widget.selectedValue,
          onChanged: widget.onchanged,
        ),
      ),
    );
  }
}

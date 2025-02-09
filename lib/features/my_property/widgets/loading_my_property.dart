import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waseet_app/core/constant/colors.dart';

class LoddingMyProperty extends StatelessWidget {
  const LoddingMyProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 130.h,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Container(
                  color: AppColors.white,
                  width: 130.w,
                  height: 20.h,
                ),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: CircleAvatar(
                  radius: 16.r,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: CircleAvatar(
                  radius: 16.r,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Container(
                  color: AppColors.white,
                  width: 120.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: CircleAvatar(
                  radius: 16.r,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: CircleAvatar(
                  radius: 16.r,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Container(
                  color: AppColors.white,
                  width: 70.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

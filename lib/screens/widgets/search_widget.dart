import 'package:ai_saas/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreCardWidget extends StatelessWidget {
  final StoreModel store;

  const StoreCardWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // جزء الصورة والـ Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Image.asset(
                  store.imageUrl,
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (store.badge != null)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4DE1B0),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      store.badge!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // تفاصيل المتجر
          Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.title,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    if (store.rating != null)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18.sp),
                          SizedBox(width: 4.w),
                          Text(
                            '${store.rating}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  store.subTitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13.sp),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (store.tag != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          store.tag!,
                          style: TextStyle(color: Colors.grey[700], fontSize: 12.sp),
                        ),
                      ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.indigoAccent,
                      size: 18.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

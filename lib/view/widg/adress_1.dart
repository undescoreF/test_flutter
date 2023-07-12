
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/model/person_model.dart';

class AdressInfo1 extends StatelessWidget {
  const AdressInfo1({Key? key, required this.personne}) : super(key: key);
  final Personne personne;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(color: Colors.white),
      child: Container(
       // height: 10.h,
        child: Column(
          children: [
            Container(
              width: 100.w,
              child: Text("Pays : ${personne.results?.location?.country}",
              style: TextStyle(fontSize: 14.sp),),
            ).paddingOnly(left: 5.w, top: 1.h),

            Container(
              width: 100.w,
              child: Text("Etat :  ${personne.results?.location?.state}",
                style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
            ).paddingOnly(left: 5.w,top: 1.h),

            Container(
              width: 100.w,
              child: Text("Ville :  ${personne.results?.location?.city}",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),),
            ).paddingOnly(left: 5.w, top: 1.h),

            Container(
              width: 100.w,
              child: Row(
                children: [
                  Text("Street :${personne.results?.location?.street?.name}",
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                  Text("N°:${personne.results?.location?.street?.number}",
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.red),).paddingOnly(left: 2.w),
                ],
              ),
            ).paddingOnly(left: 5.w, bottom: 2.h,top: 1.h),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 8.w);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/model/person_model.dart';


class AdressInfo2 extends StatelessWidget {
  const AdressInfo2({Key? key, required this.personne}) : super(key: key);
  final Personne personne;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(color: Colors.white),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Postcode : ', style: TextStyle(fontSize: 14.sp),),
                Text('${personne.results?.location?.postcode}', style: TextStyle(fontSize: 14.sp, color: Colors.red, fontWeight: FontWeight.bold),),
              ],
            ).paddingOnly(left: 5.w),
            Text("Coordonnées",style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text('Latitude : ', style: TextStyle(fontSize: 12.sp),),
                Text('${personne.results?.location?.coordinates?.latitude}', style: TextStyle(fontSize: 12.sp, color: Colors.red, fontWeight: FontWeight.bold),),
              ],
            ).paddingOnly(left: 5.w),
            Row(
              children: [
                Text('Longitude : ', style: TextStyle(fontSize: 12.sp),),
                Text('${personne.results?.location?.coordinates?.longitude}', style: TextStyle(fontSize: 12.sp, color: Colors.red, fontWeight: FontWeight.bold),),
              ],
            ).paddingOnly(left: 5.w),
            Text("Timezone",style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text('Offset : ', style: TextStyle(fontSize: 12.sp),),
                Text('${personne.results?.location?.timezone?.offset}', style: TextStyle(fontSize: 12.sp, color: Colors.red, fontWeight: FontWeight.bold),),
              ],
            ).paddingOnly(left: 5.w),
                ],
              ).paddingOnly(left: 5.w),
            ).paddingOnly(bottom: 1.h, top: 1.h),

    ).paddingOnly(top: 2.h, left: 8.w, right: 8.w);
  }
}

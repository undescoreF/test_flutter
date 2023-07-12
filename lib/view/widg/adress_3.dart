import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/model/person_model.dart';

class AdressInfo3 extends StatelessWidget {
  const AdressInfo3({Key? key, required this.personne}) : super(key: key);
  final Personne personne;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(color: Colors.white),
      child: Container(
        height: 10.h,
        child: Column(
          children: [
            Row(
              children: [
                Container(child: Text("Email :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),).paddingOnly(left: 2.w, top: 2.h)),
                Container(child: Text("${personne.results?.email}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),).paddingOnly( top: 2.h)),
              ],
            ),
            Row(
              children: [
                Container(child: Text("Phone :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),).paddingOnly(left: 2.w)),
                Container(child: Text("${personne.results?.phone}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),)),
              ],
            )
          ],
        ),
      ),
    ).paddingOnly(top: 2.h, bottom: 2.h, left: 8.w, right: 8.w);
  }
}

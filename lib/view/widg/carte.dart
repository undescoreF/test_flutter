import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/model/person_model.dart';

import '../details.dart';


class Carte extends StatefulWidget {
  const Carte({Key? key, required this.personne, required this.index}) : super(key: key);
  final List<Personne> personne;
  final int index;

  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
    return  Neumorphic(
      style: const NeumorphicStyle(
          color: Colors.white
      ),
      child: Container(
        width: 100.w,
        child: Column(
          children: [
            Container(
              width: 100.w,
              //  color: Colors.red,
              child: Text('${widget.personne[widget.index-1].results?.name?.title} '
                  '${widget.personne[widget.index-1].results?.name?.first} '
                  '${widget.personne[widget.index-1].results?.name?.last}',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(left: 4.w, top: 1.h),
            ),
            Container(
                width: 100.w,
                child:RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Email : ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: '${widget.personne[widget.index-1].results?.email}',
                      ),
                    ],
                  ),

                )
            ).paddingOnly(left: 4.w),
            Container(
              width: 100.w,
              child: Row(
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pays : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.sp),
                        ),
                        TextSpan(
                          text: '${widget.personne[widget.index-1].results?.location?.country}',
                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),
                        ),
                      ],
                    ),

                  ).paddingOnly(right: 2.w),
                  Flag.fromString('${widget.personne[widget.index-1].results?.nat}', height: 15, width: 15,)
                ],
              ),
            ).paddingOnly(left: 4.w),
            Container(
              width: 100.w,
              child: InkWell(
                onTap: ()=>Get.to(()=> Details(personne: widget.personne[widget.index-1],index: widget.index-1, pers: widget.personne,)),
                //onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => Page2())).then((value) { setState(() {}));,
                child: const Text(
                  "Voir plus",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ).paddingOnly(left: 4.w, right: 2.w, bottom: 1.h)
          ],
        ),
      ),
    ).paddingOnly(left: 3.w, right: 3.w, bottom: 2.h);
  }
}

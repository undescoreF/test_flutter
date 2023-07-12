import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/person_model.dart';


class InfoPersonne extends StatefulWidget {
  const InfoPersonne({Key? key, required this.personne}) : super(key: key);
  final Personne personne;

  @override
  State<InfoPersonne> createState() => _InfoPersonneState();
}

class _InfoPersonneState extends State<InfoPersonne> {
  @override
  Widget build(BuildContext context) {
    return
        Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 25.h,
                color: const Color(0xff7D7D7D),
              ),
            ),
            Neumorphic(
              style: const NeumorphicStyle(
                color: Colors.white,
              ),
              child: Container(
                height: 30.h,
              ),
            ).paddingSymmetric(horizontal: 8.w).paddingOnly(top: 14.h),

            ClipOval(
              child: Container(
                color: Colors.grey,
                child: CachedNetworkImage(imageUrl: "${widget.personne.results?.picture?.large}",
                  width: 100.0,
                  height: 100.0,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Colors.blue,)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ).paddingOnly(top: 8.h, left: 35.w),
            Container(
              width: 100.w,
              //color: Colors.red,
              child: Text("${widget.personne.results?.name?.first} ${widget.personne.results?.name?.last}",
                style: TextStyle(
                    fontSize: 14.sp
                ),
                textAlign: TextAlign.center,),
            ).paddingOnly(top: 21.h, left: 8.w, right: 8.w),
            Container(
              width: 100.w,
              //color: Colors.red,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: const Color(0xff7D7D7D))
                      ),
                      child: NeumorphicIcon(
                        Icons.call,
                        style: const  NeumorphicStyle(
                          color: Colors.black,
                        ),
                      ),
                    ).paddingOnly(right: 5.w),
                    onTap: (){
                      makePhoneCall("${widget.personne.results?.phone}");
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: const Color(0xff7D7D7D))
                      ),
                      child: NeumorphicIcon(
                        Icons.email,
                        style: const NeumorphicStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onTap: (){
                      sendMail("${widget.personne.results?.email}");
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: const Color(0xff7D7D7D)),
                      ),
                      child: NeumorphicIcon(
                        Icons.location_on_sharp,
                        style: const NeumorphicStyle(
                          color: Colors.black,
                        ),
                      ),
                    ).paddingOnly(left: 5.w),
                    onTap: (){
                      redirectToGoogleMaps(
                        double.parse("${widget.personne.results?.location?.coordinates?.latitude}"),
                        double.parse("${widget.personne.results?.location?.coordinates?.longitude}",)
                      );
                    },
                  )
                ],
              ),
            ).paddingOnly(top: 25.h,left: 8.w, right: 8.w),
            Container(
              width: 100.w,
              //color: Colors.red,
              height: 15.5.h,
              child: Column(
                children: [
                  nom_info("Titre : ", "${widget.personne.results?.name?.title}").paddingOnly(top: 1.h),
                  nom_info("Nom : ", "${widget.personne.results?.name?.last}"),
                  nom_info("Prenom : ", "${widget.personne.results?.name?.first}"),
                  nom_info("Sexe : ", "${widget.personne.results?.gender}"),
                ],
              ),
            ).paddingOnly(top: 28.h, left: 8.w, right: 8.w)

          ],
        );

  }
}

Widget nom_info(text_1, text_2){
  return  Container(
    width: 100.w,
    child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            children: [
              TextSpan(
                text: text_1,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                  text: text_2,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp
                  )
              ),

            ]
        )),
  ).paddingOnly(left: 5.w);

}
void redirectToGoogleMaps(double latitude, double longitude) async {
  String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Impossible d\'ouvrir Google Maps';
  }
}
Future<void> makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible de lancer l\'appel téléphonique';
  }
}Future<void> sendMail(String mail) async {
  final url = 'mailto:$mail?subject=News&body=New%20plugin';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible de lancer l\'appel téléphonique';
  }
}

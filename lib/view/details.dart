import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/model/name_model.dart';
import 'package:test_app/model/result_model.dart';
import 'package:test_app/view/home_page.dart';
import 'package:test_app/view/widg/adress_1.dart';
import 'package:test_app/view/widg/adress_2.dart';
import 'package:test_app/view/widg/adress_3.dart';
import 'package:test_app/view/widg/info_personne.dart';
import '../model/person_model.dart';
import '../services/database_service.dart';




class Details extends StatefulWidget {
  const Details({Key? key, required this.personne, required this.index, required this.pers }) : super(key: key);
  final Personne personne;
  final List<Personne> pers;
  final int index;

  @override
  State<Details> createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    TextEditingController title = TextEditingController(text: "${widget.personne.results?.name?.title}");
    TextEditingController nom = TextEditingController(text: "${widget.personne.results?.name?.last}");
    TextEditingController prenom = TextEditingController(text: "${widget.personne.results?.name?.first}");
    TextEditingController num = TextEditingController(text: "${widget.personne.results?.phone}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Hey, Faith!"),
      ),
      body: ListView(
        children: [
          InfoPersonne(personne: widget.personne,),
          Text("Adresse", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),).paddingOnly(left: 8.w, top: 2.h),
          AdressInfo1(personne: widget.personne),
          AdressInfo2(personne: widget.personne),
          Text("Contacts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),).paddingOnly(left: 8.w, top: 2.h),
          AdressInfo3(personne: widget.personne),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
               style:const NeumorphicStyle(color: Colors.black),
               onPressed: () {
                 Get.defaultDialog(
                   backgroundColor: Colors.white,
                     confirm: InkWell(
                         child: Text("Enregister",style: TextStyle(fontWeight: FontWeight.bold),).paddingOnly(left: 3.w),
                     onTap: (){
                           if(_formKey.currentState!.validate()){
                             final name = Name(
                               first: prenom.text,
                               last: nom.text,
                               title: title.text
                             );
                             final person = Personne(
                                 results: Results(
                                     cell: "${widget.personne.results?.cell}",
                                     email: "${widget.personne.results?.email}",
                                     gender: "${widget.personne.results?.gender}",
                                     idp: widget.personne.results?.idp,
                                     location: widget.personne.results?.location,
                                     dob: widget.personne.results?.dob,
                                     login: widget.personne.results?.login,
                                     nat: "${widget.personne.results?.nat}",
                                     phone: num.text,
                                     registered: widget.personne.results?.registered,
                                     name: name,
                                     picture: widget.personne.results?.picture
                                 )
                             );
                             DatabaseService.updateUser(widget.index, person);
                             setState(() {
                               widget.pers[widget.index] = person;
                             });
                             Get.offAll(()=>HomePage(personne: widget.pers));
                           }
                     },),
                     cancel: InkWell(child: const  Text("Annuler",style: TextStyle(fontWeight: FontWeight.bold),), onTap: ()=>Get.back(),),
                     title:"Modification",
                 content: Form(
                   key: _formKey,
                   child: ListView(
                     shrinkWrap: true,
                   children: [
                   champ("Titre",title.text, title),
                   champ("Nom",nom.text, nom),
                   champ("Prenom",prenom.text, prenom),
                   champ("Phone",num.text, num),
                   ],
                   ),
                 ));
               },
               child: const  Text("Modifier", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
              ),
              NeumorphicButton(
                style:const NeumorphicStyle(color: Colors.black),
                onPressed: (){
                  print(widget.pers.length);
                  DatabaseService.deleteUser(widget.index);
                    //Navigator.pop(context);

                  setState(() {
                    widget.pers.removeAt(widget.index);
                  });
                  print(widget.pers.length);
                  Get.offAll(()=>HomePage(personne: widget.pers));
                },
                child: const  Text("Supprimer", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
              ).paddingOnly(left: 3.w)
            ],
          )
        ],
      ),
    );
  }
  TextFormField champ(text,text_1, TextEditingController ctrl){
    return TextFormField(
     // initialValue: text_1,
        controller: ctrl,
        decoration:  InputDecoration(
          labelText:  '$text',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          enabledBorder:const  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder:const  UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff33907C),
            ),
          ),
        ),
      validator: (value) {
        if(value!=null&& value.isNotEmpty){
          text_1=value!;
        }
        else{
          return "Champ obigatoire";
        }
      },
      onChanged: (value) => setState(() {
        text_1=value;
      }),);
  }

}

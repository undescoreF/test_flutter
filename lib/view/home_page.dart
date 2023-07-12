import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/view/widg/carte.dart';
import '../model/person_model.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.personne}) : super(key: key);
  List<Personne> personne;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController ver = TextEditingController(text:'');
  String searchQuery = '';
  List<Personne> filteredPersonnes = [];
  List<Personne> searchPersonByName(String searchQuery, List<Personne> pers) {
    return pers.where((personne) => (personne.results!.email!+personne.results!.phone!+
        personne.results!.location!.country!+personne.results!.name!.title!+
        personne.results!.name!.first!+personne.results!.name!.last!).toLowerCase().contains(searchQuery.toLowerCase())).toList();
  }
  @override
  Widget build(BuildContext context) {
    filteredPersonnes =searchPersonByName(searchQuery, widget.personne);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const  Color(0xff545454),
        title: const Text("Hey, Faith!", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(55.0),
            child: Column(
              children: [
                Text("Voici la liste des personnes,veuillez saisir un nom\nou tout autre information sur la personne\n"
                    "pour effectuer une recherche...",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp
                  ),textAlign: TextAlign.center,
                ).paddingOnly(
                    left: 3.w, right: 3.w,
                  top: 1.h
                ),
               // Recherche(ver: widget.ctrl, persn: widget.personne,).paddingOnly(top: 3.h,bottom: 2.h)
          Container(
            //color: Colors.red,
              height: 6.h,
              child: TextField(
                controller: ver,
                onChanged: (value) {
                  print(ver.text);
                  setState(() {
                    value=ver.text;
                    searchQuery = value;
                    value=ver.text;
                  });
                  if(searchQuery.trim().isEmpty||searchQuery.trim()==null|| searchQuery.trim()==""){
                    filteredPersonnes =widget.personne;
                  }
                  else{
                    filteredPersonnes = searchPersonByName(searchQuery, widget.personne);
                  }
                },
                decoration: const InputDecoration(
                    hintText: "Rechercher une personne",
                    alignLabelWithHint: true,
                    focusColor: Colors.black87,
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    isDense: true,
                    prefixIcon:  Icon(Icons.search,size: 30,color: Color(0xff000000),),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide( color: Colors.white,width: 2)
                    ),

                ),
              )
          ).paddingSymmetric(horizontal: 8.w).paddingOnly(top: 3.h,bottom: 2.h),
              ],
            )
        ),
        toolbarHeight: 20.h,
      ),
      body: ListView.builder(
           itemCount: filteredPersonnes.length+1,
         //  itemCount: 2,
          itemBuilder: (context, index) {
            if(index==0){
              return Text("Liste de ${filteredPersonnes.length} personne(s)",
                      style: TextStyle(
                        color: Colors.black,
                       // fontWeight: FontWeight.bold,
                        fontSize: 14.sp
                      ),).paddingOnly(left: 3.w, top: 2.h, bottom: 2.h);
            }
            else{
              return Carte(personne: filteredPersonnes, index: index);

            }
          },)
    );
  }
}

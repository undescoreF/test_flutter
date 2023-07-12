import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/services/database_service.dart';
import 'package:test_app/view/home_page.dart';

import 'model/person_model.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.setupDatabase();
  await addUser();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder:(context, orientation, deviceType)
    {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<List<Personne>>(
            future: DatabaseService.getAllPer(),
            initialData: [],
            builder: (context, snapshot) => HomePage(personne: snapshot.requireData),
          ),
        debugShowCheckedModeBanner: false,
      );
    });


    }

  }




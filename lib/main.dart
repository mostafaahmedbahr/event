

 import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'login_view.dart';
void main() async{
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginView(),

    );
  }
}

// Scaffold(
// backgroundColor: Colors.white,
// appBar: AppBar(),
// body:state is !GetUserLoadingState ?
// cubit.model?.data![cubit.user?? Random().nextInt(cubit.l!)].name != null?
// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text("${cubit.model?.data![cubit.user?? Random().nextInt(cubit.l!)].name}".toUpperCase(),
// style: const TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.bold,
// fontStyle: FontStyle.italic,
// ),),
// Text("${cubit.model?.data![cubit.user?? Random().nextInt(cubit.l!)].phone}",
// style: const TextStyle(
// fontSize: 25,
// color: Colors.deepOrange,
// fontStyle: FontStyle.italic,
// ),),
// ],
// ),
// ):const Center(child: Text("click to get random user",
// style: TextStyle(
// fontSize: 50,
// fontWeight: FontWeight.bold,
// ),)) : Center(
// child:  Image.asset("assets/images/gift-35.webp",
// fit: BoxFit.cover,),
// ) ,
// floatingActionButton: FloatingActionButton(
// onPressed: ()async
// {
// await cubit.getData();
// cubit.randomUser();
// },
// child: const Icon(Icons.repeat),
// ),
// )
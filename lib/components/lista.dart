import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


 class Lista extends StatelessWidget {
   const Lista({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(

         body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
         builder: (context, AsyncSnapshot snapshot){
           if(!snapshot.hasData){
             return const Center(
               child: CircularProgressIndicator(),
             );
           }
           List<DocumentSnapshot> docs = snapshot.data!.documents;
           return ListView.builder(itemCount: docs.length,
           itemBuilder: (context, index){
           final data = docs[index].data() as Map<String, dynamic> ;
             return ListTile(
               leading: Checkbox(value: data['nombre'], onChanged: (bool? value) {  },),
               title: Text(data['materia']),
             );
           },);
         },)
       ) ,
     );

   }
 }

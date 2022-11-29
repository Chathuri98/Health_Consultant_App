import 'package:doctor_app/screens/auth/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../first_page.dart';
import '../screens/welcome/welcome_screen.dart';



class AuthController extends GetxController{
   static AuthController instance = Get.find();
   late Rx<User?> _user;
   FirebaseAuth auth = FirebaseAuth.instance;


   @override
   void onReady(){
     super.onReady();
    _user =  Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
   }

   //Redirect pages
   _initialScreen(User? user){
     if(user==null){
       print("login page");
       Get.offAll(()=>WelcomeScreen());
     }else{
       Get.offAll(()=>FirstPage(email: user.email!));
     }
   }

   //Authentication and validation
   void register(String email, password)async{
     try{
       await auth.createUserWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("About User", "User message",
       backgroundColor: Colors.redAccent,
       snackPosition: SnackPosition.BOTTOM,
           titleText: Text(
             "Account creation failed",
             style: TextStyle(
               color: Colors.white
             ),
           ),
         messageText: Text(
           e.toString(),
           style: TextStyle(
               color: Colors.white
           )
         )
       );
     }
   }

   //Sign in authentication
   void login(String email, password)async{
     try{
       await auth.signInWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("About Login", "Login message",
           backgroundColor: Colors.redAccent,
           snackPosition: SnackPosition.BOTTOM,
           titleText: Text(
             "Login failed",
             style: TextStyle(
                 color: Colors.white
             ),
           ),
           messageText: Text(
               e.toString(),
               style: TextStyle(
                   color: Colors.white
               )
           )
       );
     }
   }

   //Logout authentication
   void logout()async{
     await auth.signOut();
   }


}
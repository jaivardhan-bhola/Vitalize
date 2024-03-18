import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/pages/home.dart';
import 'package:vitalize/pages/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var hiveBox = Hive.box('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF746E),
      body: Center(
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(child: Image.asset('assets/Logo.png', height: 150, width: 150 ,), borderRadius: BorderRadius.circular(10)),
            SizedBox(height: 10),
            Text('Welcome', style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),),
            SizedBox(height: 5),
            Text('We are here to support you throughout your journey', style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),),
            SizedBox(height: 75),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                
                if(hiveBox.isEmpty){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                }
                
              }, child: Text('Get Started'), style: ElevatedButton.styleFrom(backgroundColor: Color(0xffffffff), foregroundColor: Color(0xffFF746E), minimumSize: Size(MediaQuery.of(context).size.width*0.9, MediaQuery.of(context).size.height*0.05), textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), ),
            ),
          ],
        ),
      )
    );
  }
}
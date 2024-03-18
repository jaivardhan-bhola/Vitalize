import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vitalize/pages/about.dart';
import 'package:vitalize/pages/ambulance.dart';
import 'package:vitalize/pages/bloodbanks.dart';
import 'package:vitalize/pages/doctors.dart';
import 'package:vitalize/pages/hospitals.dart';
import 'package:vitalize/pages/login.dart';
import 'package:vitalize/pages/onboarding.dart';
import 'package:vitalize/pages/oxygenbanks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, Map>? entries = {}; 
  int currentIndex = 0;
  final screens = [
    Hospitals(),
    Doctors(),
    Ambulance(),
    BloodBanks(),
    OxygenBanks(),
  ];
  Box <dynamic> hiveBox = Hive.box('user');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    endDrawer: Drawer(
        backgroundColor: Color(0xffFF746E),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffffffff),
                ),
                Image.asset('assets/images/drawerBackground.png', height: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.cover, ),
                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFF746E),
                          radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 45,
                              child: Text("A", style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Abc", style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('How to use'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                },
              ),
            ),
            SizedBox(height: 150),
            ElevatedButton(onPressed: (){
              hiveBox.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              }, child: Text('Logout', style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(MediaQuery.of(context).size.width*0.5, MediaQuery.of(context).size.height*0.05),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              )),
          ],
        ),
      ),
    appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFF746E),
        title: Text(
          'Vitalize',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(child: Image.asset('assets/Logo.png', height: 20, width: 50), borderRadius: BorderRadius.circular(50)),
        ),
        actions: [
          Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('A',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Color(0xffFF746E),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    )),
                ),
              );
            }
          ),
        ],
       ),
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        color: Color(0xffFF746E),
        backgroundColor: Color(0xffffffff),
        animationDuration: Duration(milliseconds: 150),
        items: [
          Icon(Icons.home_rounded, color: Colors.white,),
          Icon(MdiIcons.fromString('stethoscope'), color: Colors.white),
          SvgPicture.asset('assets/icons/ambulance.svg', height: 24, width: 24, color: Colors.white),
          Icon(Icons.bloodtype_rounded, color: Colors.white),
          SvgPicture.asset('assets/icons/oxygen.svg', height: 24, width: 24, color: Colors.white),
        ],
      ),
    );
  }
}
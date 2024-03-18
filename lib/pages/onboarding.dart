import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vitalize/pages/welcome.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PageView(
          onPageChanged: (int index) {
            setState(() {
              _isLastPage = index == 8;
            });
          },
          controller: _controller,
          children: [
            Container(
              color: Color(0xfff05253),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Welcome to Vitalize', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding1.gif',height: MediaQuery.of(context).size.height * 0.7),
                ],
              ),
            ),
            Container(
              color: Colors.redAccent[100],
              child: Column(  
                children: [
                  SizedBox(height: 100),
                  Text('Login or Sign Up', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,),
                  SizedBox(height: 20),
                  Image.asset('assets/mockups/Onboarding2.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
            Container(
              color: Color(0xffFF746E),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Choose or Search for a hospital', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    
                  ),
                  textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding3.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
            Container(
              color: Colors.redAccent[200],
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Tap to view details', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding4.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
            Container(
              color: Colors.green[100],
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Choose or search a doctor', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ), textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding5.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
            Container(
              color: Colors.green[200],
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Book an Ambulance from your location', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding6.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
            Container(
              color: Colors.green[300],
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Get info about nearby blood banks', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding7.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            ),
                        Container(
              color: Colors.green[400],
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Get info about nearest oxygen tank suppliers', style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),textAlign: TextAlign.center,),
                  Image.asset('assets/mockups/Onboarding8.png', height: MediaQuery.of(context).size.height * 0.6, width: MediaQuery.of(context).size.width * 0.7,),
                ],
              ),
            )

          ]
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                },
                child: Text('Skip', style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              ),
              SmoothPageIndicator(controller: _controller, count: 8, effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xff1A1528),
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 4,
                spacing: 5,
              )),

              _isLastPage ? GestureDetector(
                onTap: () {
                
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                },
                child: Text('Done', style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              ) : GestureDetector(
                onTap: () {
                  _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                },
                child: Text('Next', style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              )

            ],
          ))
        ]
      ),
      );
    
  }
}
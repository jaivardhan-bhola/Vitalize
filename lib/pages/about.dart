import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('About Us', style:GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),),
      ),
      body: Card(
        color: Colors.redAccent[200],
        child: ListView(
          children: [
           
              Card(
                color: Colors.redAccent[100],
                child: Column(
                  
                  children: [
                    Text('About Vitalize', style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Welcome to Vitalize, your comprehensive healthcare companion designed to simplify and streamline your access to medical services. With a commitment to convenience and efficiency, Vitalize offers a range of features aimed at enhancing your healthcare experience.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.redAccent[100],
                child: Column(
                  children: [
                    Text('Our Mission', style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('At Vitalize, our mission is to revolutionize healthcare accessibility by empowering individuals to take control of their well-being. Through innovative technology, we provide seamless access to quality medical services, breaking down barriers regardless of location or circumstance. We prioritize informed decision-making, ensuring quick access to critical services like ambulance booking and real-time bed availability. Beyond immediate needs, we foster a culture of wellness and collaborate with healthcare providers for collective impact. Together, we\'re shaping a future where every individual has the opportunity for a healthier, more fulfilling life. Join us in our mission to empower healthcare for all.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.redAccent[100],
                child: Column(
                  children: [
                    Text('Key Features', style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Discover Nearby Hospitals and Specialists: In times of need, finding the nearest hospital equipped with the right specialists is paramount. Vitalize provides a seamless search function, enabling users to locate the closest hospitals along with information about available specialists, ensuring prompt and targeted medical attention.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Connect with Local Doctors: Whether you\'re seeking routine check-ups or specialized care, Vitalize makes it easy to find and connect with nearby doctors. Our intuitive platform allows users to explore a network of healthcare professionals, facilitating efficient appointment scheduling and communication.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Effortless Ambulance Booking: During emergencies, every second counts. Vitalize offers a hassle-free ambulance booking feature, allowing users to request emergency medical transportation with just a few taps. Rest assured, help is always within reach with Vitalize at your fingertips.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Real-Time Bed Availability: Navigating hospital admissions can be daunting, especially during critical situations. Vitalize provides real-time updates on bed availability in hospitals nearby, empowering users to make informed decisions and access timely medical care with ease.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Blood Availability Tracker: Access to blood can be a matter of life and death. Vitalize offers a dedicated feature to track blood availability, ensuring that patients in need can quickly locate and secure the blood products they require for treatment.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('• Experience Vitalize: With Vitalize, healthcare access is no longer a challenge but a seamless journey. Our user-centric app is here to support you every step of the way, ensuring that quality medical care is always within reach. Download Vitalize today and take control of your health with confidence.', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                    ),
          ],
        ),
      ),
   ])) );
  }
}
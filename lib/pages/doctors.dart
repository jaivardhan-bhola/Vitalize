import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  TextEditingController _searchController = TextEditingController();
  List _Doctors=[];
  List _Doctor=[];
  Future<void> getDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final data = await json.decode(response);
    setState(() {
      _Doctors = data["doctors"];
      _Doctor = _Doctors;
    });
  }
  @override
  void initState() {
    super.initState();
    getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Doctors', style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Color(0xffFF746E),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => {
                  setState(() {
                    _Doctor = _Doctors.where((element) => element["name"].toLowerCase().contains(value.toLowerCase())).toList();
                  })
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _Doctor.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                          BorderRadius.all(
                            Radius.circular(10.0))),
                            title: Text(_Doctor[index]["name"], style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xffFF746E),
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          content: Builder(
                            builder: (context) {                            
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return SizedBox(height: height*0.55, width: width, child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Image.network(_Doctor[index]["image"]),
                                SizedBox(height: 20),
                                Text("Experience: ${_Doctor[index]["experience"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text("Type: ${_Doctor[index]["type"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text("Available: ${_Doctor[index]["working_hours"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text(_Doctor[index]["location"], style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text("Fees: ₹${_Doctor[index]["fees"]}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))),
                                    SizedBox(height: 10),
                                    Text("Phone: ${_Doctor[index]["phone"]}",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ))),                       
                                    ]
                                    )
                                    );
                    }
                                    )
                    ),
                    );
                  },
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0, right:8.0, top:40),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide())),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),  
                              Text(_Doctor[index]["name"], style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ))),
                                SizedBox(height: 5),
                                Text("Experience: ${_Doctor[index]["experience"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 5),
                                Text("Type: ${_Doctor[index]["type"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 5),
                                Text("Available: ${_Doctor[index]["working_hours"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 5),
                                Text(_Doctor[index]["location"], style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:10.0),
                            child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.network(_Doctor[index]["image"], height: 100, width: 100, fit: BoxFit.cover)),
                          )
                        ],
                      )),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],)
    );
  }
}

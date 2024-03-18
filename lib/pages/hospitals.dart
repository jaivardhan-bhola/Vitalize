import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  TextEditingController _searchController = TextEditingController();
  List _Hospitals=[];
  List _Hospital=[];
  Future<void> getHospitals() async {
    final String response = await rootBundle.loadString('assets/hospitals.json');
    final data = await json.decode(response);
    setState(() {
      _Hospitals = data["hospitals"];
      _Hospital = _Hospitals;
    });
  }
  @override
  void initState() {
    super.initState();
    getHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Hospitals', style: GoogleFonts.inter(
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
                    _Hospital = _Hospitals.where((element) => element["name"].toLowerCase().contains(value.toLowerCase())).toList();
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
            itemCount: _Hospital.length,
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
                            title: Text(_Hospital[index]["name"], style: GoogleFonts.inter(
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
                              return SizedBox(height: height*0.4, width: width, child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Image.network(_Hospital[index]["image"]),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(_Hospital[index]["star"], (i) => Icon(Icons.star, color: Color(0xffFFD700), size: 15,)),
                                    ),
                                    Row(
                                      children: List.generate((5 - _Hospital[index]["star"]).toInt(), (i) => const Icon(Icons.star, color: Colors.grey, size: 15,)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text("Speciality: ${_Hospital[index]["speciality"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text("Opens: ${_Hospital[index]["working_hours"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text(_Hospital[index]["location"], style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 10),
                                Text("Beds: ${_Hospital[index]["beds"]}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))),
                                    SizedBox(height: 10),
                                    Text("Phone: ${_Hospital[index]["phone"]}",
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
                              Text(_Hospital[index]["name"], style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ))),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(_Hospital[index]["star"], (i) => Icon(Icons.star, color: Color(0xffFFD700), size: 15,)),
                                    ),
                                    Row(
                                      children: List.generate((5 - _Hospital[index]["star"]).toInt(), (i) => const Icon(Icons.star, color: Colors.grey, size: 15,)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text("Speciality: ${_Hospital[index]["speciality"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 5),
                                Text("Opens: ${_Hospital[index]["working_hours"]}", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))),
                                SizedBox(height: 5),
                                Text(_Hospital[index]["location"], style: GoogleFonts.inter(
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
                            child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.network(_Hospital[index]["image"], height: 100, width: 100, fit: BoxFit.cover)),
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

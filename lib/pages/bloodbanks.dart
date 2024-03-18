import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodBanks extends StatefulWidget {
  @override
  _BloodBanksState createState() => _BloodBanksState();
}

class _BloodBanksState extends State<BloodBanks> {
  List _BloodBanks=[];
  Future<void> getBloodBanks() async {
    final String response = await rootBundle.loadString('assets/bloodbanks.json');
    final data = await json.decode(response);
    setState(() {
      _BloodBanks = data["bloodbanks"];
      

    });
  }
  @override
  void initState() {
    super.initState();
    getBloodBanks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Blood Banks', style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Color(0xffFF746E),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),),
        ),
        SizedBox(height: 20),
        // create a grid view builder to display the details from the json fil, only names are displayed in a 4x2 grid
        Expanded(
          child: GridView.builder(
            itemCount: _BloodBanks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(_BloodBanks[index]["group"], style: GoogleFonts.inter(
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
                                ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset(_BloodBanks[index]["image"], height: 150, width: 150, fit: BoxFit.cover)),
                                SizedBox(height: 20),
                                Text("Available At:", style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ))
                                ),
                                SizedBox(height: 10),

                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _BloodBanks[index]["locations"].length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffFF746E),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(_BloodBanks[index]["locations"][i]["name"], style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),),
                                                SizedBox(height: 10),
                                                Text("Qty: "+_BloodBanks[index]["locations"][i]["qty"], style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),),
                                                SizedBox(height: 10),
                                                Text("Contact: "+_BloodBanks[index]["locations"][i]["contact"], style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),  
                                    ]
                                    )
                                    );
                    }
                                    )
                    ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFF746E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(_BloodBanks[index]["image"], height: 100, width: 100),
                          SizedBox(height: 10),
                          Text(_BloodBanks[index]["group"], style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    ]));
  }
}

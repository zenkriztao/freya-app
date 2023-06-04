import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/screens/patient/doctor_profile.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class TopRatedList extends StatefulWidget {
  const TopRatedList({Key? key}) : super(key: key);

  @override
  State<TopRatedList> createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctor')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: min(5, snapshot.data!.docs.length),
            itemBuilder: (context, index) {
              DocumentSnapshot doctor = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfile(
                              doctor: doctor['name'],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(doctor['profilePhoto'] ?? ''),
                            backgroundColor: Color(0xFFBF717E),
                            radius: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                doctor['name'],
                                style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                doctor['specialization'],
                                style: GoogleFonts.nunito(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Typicons.star_full_outline,
                                      size: 20,
                                      color: Color(0xFFE35970),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      doctor['rating'].toString(),
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color(0xFFE35970),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Rating",
                                        style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            color: Color(0xFFD08F9A),
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

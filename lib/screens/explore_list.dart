import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/screens/patient/doctor_profile.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ExploreList extends StatefulWidget {
  final String type;
  const ExploreList({Key? key, required this.type}) : super(key: key);

  @override
  State<ExploreList> createState() => _ExploreListState();
}

class _ExploreListState extends State<ExploreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '${widget.type}s',
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('doctor')
              .orderBy('specialization')
              .startAt([widget.type]).endAt(
                  ['${widget.type}\uf8ff']).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                DocumentSnapshot doctor = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Color(0xFFE35970),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                                  NetworkImage(doctor['profilePhoto']),
                              backgroundColor: Color(0xFFE35970),
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
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  doctor['specialization'],
                                  style: GoogleFonts.nunito(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
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
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}

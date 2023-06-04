import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/globals.dart';
import 'package:intl/intl.dart';

class AppointmentHistoryList extends StatefulWidget {
  const AppointmentHistoryList({Key? key}) : super(key: key);

  @override
  State<AppointmentHistoryList> createState() => _AppointmentHistoryListState();
}

class _AppointmentHistoryListState extends State<AppointmentHistoryList> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late String _documentID;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  String _dateFormatter(String timestamp) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(timestamp));
    return formattedDate;
  }

  Future<void> deleteAppointment(String docID) {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(user.uid)
        .collection('all')
        .doc(docID)
        .delete();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('appointments')
              .doc(user.uid)
              .collection('all')
              .orderBy('date', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data!.size == 0
                ? Text(
                    'History Appears here...',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 201, 190, 190),
                                    width: 4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _dateFormatter(
                                      document['date'].toDate().toString()),
                                  style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                          255, 32, 90, 137),
                                      fontWeight: FontWeight.bold),
                                ),
                                // doctor name
                                Text(
                                  '${index + 1}. ${isDoctor ? '${document['patientName']}' : '${document['doctorName']}'}',
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // date

                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  document['description'] ?? 'No description',
                                  style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

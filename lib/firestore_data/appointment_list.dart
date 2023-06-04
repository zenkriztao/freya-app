import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/globals.dart';
import 'package:intl/intl.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late String _documentID;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  // delete appointment from both patient and doctor
  Future<void> deleteAppointment(
      String docID, String doctorId, String patientId) async {
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(doctorId)
        .collection('pending')
        .doc(docID)
        .delete();
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(patientId)
        .collection('pending')
        .doc(docID)
        .delete();
  }

  String _dateFormatter(String timestamp) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(timestamp));
    return formattedDate;
  }

  String _timeFormatter(String timestamp) {
    String formattedTime =
        DateFormat('kk:mm').format(DateTime.parse(timestamp));
    return formattedTime;
  }

  // alert box for confirmation of deleting appointment
  showAlertDialog(BuildContext context, String doctorId, String patientId) {
    // No
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // YES
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        deleteAppointment(_documentID, doctorId, patientId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Delete"),
      content: const Text("Are you sure you want to delete this Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // helping in removing pending appointment
  _checkDiff(DateTime date) {
    print(date);
    var diff = DateTime.now().difference(date).inSeconds;
    print('date difference : $diff');
    if (diff > 0) {
      return true;
    } else {
      return false;
    }
  }

  // for comparing date
  _compareDate(String date) {
    if (_dateFormatter(DateTime.now().toString())
            .compareTo(_dateFormatter(date)) ==
        0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(user.uid)
            .collection('pending')
            .orderBy('date')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.size == 0
              ? Center(
                  child: Text(
                    'No Appointment',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];

                    // delete past appointments from pending appointment list
                    if (_checkDiff(document['date'].toDate())) {
                      deleteAppointment(document.id, document['doctorId'],
                          document['patientId']);
                    }

                    // each appointment
                    return Card(
                      elevation: 3,
                      child: InkWell(
                        onTap: () {},
                        child: ExpansionTile(
                          initiallyExpanded: true,

                          // main info of appointment
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // doctor name

                              // Today label
                              Text(
                                _compareDate(
                                        document['date'].toDate().toString())
                                    ? "TODAY"
                                    : "",
                                style: GoogleFonts.nunito(
                                    color: Color(0xFFE35970),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(
                                width: 0,
                              ),
                            ],
                          ),

                          // appointment date
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              _dateFormatter(
                                  document['date'].toDate().toString()),
                              style: GoogleFonts.nunito(
                                  color: Color.fromARGB(255, 32, 90, 137),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          // patient info
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, right: 10, left: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // patient info
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: Text(
                                          isDoctor
                                              ? document['patientName']
                                              : document['doctorName'],
                                          style: GoogleFonts.nunito(
                                            color: Color(0xFFE35970),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        isDoctor
                                            ? ''
                                            : "User name: ${document['patientName']}",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Appointment time
                                      Text(
                                        'Time: ${_timeFormatter(document['date'].toDate().toString())}',
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        'Description : ${document['description']}',
                                        style: GoogleFonts.nunito(fontSize: 16),
                                      )
                                    ],
                                  ),

                                  // delete button
                                  IconButton(
                                    tooltip: 'Delete Appointment',
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      _documentID = document.id;
                                      showAlertDialog(
                                          context,
                                          document['doctorId'],
                                          document['patientId']);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
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

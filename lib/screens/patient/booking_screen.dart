import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/screens/patient/appointments.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final String doctor;
  final String doctorUid;

  const BookingScreen({Key? key, required this.doctor, required this.doctorUid})
      : super(key: key);
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String timeText = 'Select Time';
  late String dateUTC;
  late String dateTime;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  // function for selecting appointment date
  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (date) {
        setState(
          () {
            selectedDate = date!;
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(selectedDate);
            _dateController.text = formattedDate;
            dateUTC = DateFormat('yyyy-MM-dd').format(selectedDate);
          },
        );
      },
    );
  }

  // function for selecting appointment time
  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime = localizations.formatTimeOfDay(selectedTime!,
        alwaysUse24HourFormat: false);

    setState(() {
      timeText = formattedTime;
      _timeController.text = timeText;
    });
    dateTime = selectedTime.toString().substring(10, 15);
  }

  // for showing appointment booked
  showAlertDialog(BuildContext context) {
    // OK button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            // view all pending appointments
            builder: (context) => const Appointments(),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Done!",
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Appointment is registered.",
        style: GoogleFonts.nunito(),
      ),
      actions: [
        okButton,
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

  @override
  void initState() {
    super.initState();
    _getUser();
    selectTime(context);
    _doctorController.text = widget.doctor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFE35970),
        elevation: 0,
        title: Text(
          'Make Appointment',
          style: GoogleFonts.nunito(
            color: Color(0xFFE35970),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      // enter patient details
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Details Appointment',
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        controller: _nameController,
                        focusNode: f1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter User Name';
                          }
                          return null;
                        },
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Color(0xFFE35970)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Full Name',
                          hintStyle: GoogleFonts.nunito(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // patient phone number
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        focusNode: f2,
                        controller: _phoneController,
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Color(0xFFE35970)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Phone Mobile',
                          hintStyle: GoogleFonts.nunito(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone number';
                          } else if (value.length < 10) {
                            return 'Please Enter correct Phone number';
                          }
                          return null;
                        },
                        onFieldSubmitted: (String value) {
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Doctor name
                      TextFormField(
                        readOnly: true,
                        controller: _doctorController,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please enter Psychologist name';
                          return null;
                        },
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Color(0xFFE35970)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Psychologist Name*',
                          hintStyle: GoogleFonts.nunito(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // appointment date
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              onTap: () {
                                selectDate(context);
                              },
                              focusNode: f4,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Select Date*',
                                hintStyle: GoogleFonts.nunito(
                                  color: Colors.black26,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              controller: _dateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter the Date';
                                }
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f4.unfocus();
                                FocusScope.of(context).requestFocus(f5);
                              },
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xFFE35970), // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectDate(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              onTap: () {
                                selectTime(context);
                              },
                              focusNode: f5,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFFE35970)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Select Time*',
                                hintStyle: GoogleFonts.nunito(
                                  color: Colors.black26,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              controller: _timeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter the Time';
                                }
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f5.unfocus();
                              },
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xFFE35970), // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.timer_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectTime(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        focusNode: f3,
                        controller: _descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 100),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFE35970)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText:
                              'Do you have any symptoms that vary widely and can affect mood, thinking, and ability to interact with others?',
                          hintStyle: GoogleFonts.nunito(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          f3.unfocus();
                          FocusScope.of(context).requestFocus(f4);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      // book appointment button
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Color(0xFFE35970),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(_nameController.text);
                              print(_dateController.text);
                              print(widget.doctor);
                              showAlertDialog(context);
                              _createAppointment();
                            }
                          },
                          child: Text(
                            "Make New Appointment",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    // print(dateUTC + ' ' + date_Time + ':00');
    String appointId = '${user.uid}${widget.doctorUid}$dateUTC $dateTime}';
    print('${widget.doctorUid}.');
    print('${user.uid}.');
    print('${appointId}.');

    var details = {
      'patientName': _nameController.text,
      'phone': _phoneController.text,
      'description': _descriptionController.text,
      'doctorName': _doctorController.text,
      'date': DateTime.parse('$dateUTC $dateTime:00'),
      'patientId': user.uid,
      'doctorId': widget.doctorUid,
      //help in cancelling appointment
      'appointmentID': appointId,
    };

    FirebaseFirestore.instance
        .collection('appointments')
        .doc(user.uid)
        .collection('pending')
        .doc(appointId)
        .set(details, SetOptions(merge: true));

    FirebaseFirestore.instance
        .collection('appointments')
        .doc(user.uid)
        .collection('all')
        .doc(appointId)
        .set(details, SetOptions(merge: true));

    // add to doctor data
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(widget.doctorUid)
        .collection('pending')
        .doc(appointId)
        .set(details, SetOptions(merge: true));

    FirebaseFirestore.instance
        .collection('appointments')
        .doc(widget.doctorUid)
        .collection('all')
        .doc(appointId)
        .set(details, SetOptions(merge: true));
  }
}

import 'package:flutter/material.dart';
import 'package:freya/components/sign_button.dart';
import 'package:freya/screens/chat_user/chatuser_screen.dart';
import 'package:freya/screens/counselor/counselor_screen.dart';
import 'package:freya/screens/chat/chat_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> appointments = [
    {"doctor": "dr. Siapa nih", "status": "Waiting respon"},
    {"doctor": "dr. Siapa tuh", "status": "Accepted"},
    {"doctor": "dr. Jack Lim", "status": "Rejected"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Appointment',
          style: TextStyle(
            color: Color.fromARGB(255, 160, 36, 28),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: appointments.length == 0
          ? Center(
              child: Text(
                '----------No more appointment----------',
                style: TextStyle(
                  color: Color.fromARGB(255, 160, 36, 28),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color.fromARGB(255, 143, 141, 141),
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemCount: appointments.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  color: Color.fromARGB(0, 248, 248, 248),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromARGB(0, 248, 248, 248),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (appointments[index]['status'] ==
                                      'Waiting respon') {
                                    Navigator.pushNamed(
                                        context, ChatUserScreen.routeName);
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      appointments[index]['doctor'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      appointments[index]['status'],
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: appointments[index]['status'] ==
                                                'Waiting respon'
                                            ? Color.fromARGB(255, 247, 173, 141)
                                            : appointments[index]['status'] ==
                                                    'Accepted'
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  appointments[index]['status'] ==
                                          'Waiting respon'
                                      ? ''
                                      : '',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: appointments.length == 0
          ? null
          : Padding(
              padding: EdgeInsets.all(20),
              child: SignButton(
                text: 'Make New Appointment',
                press: () {
                  Navigator.pushNamed(context, CounselorScreen.routeName);
// Your functionality here
                },
              ),
            ),
    );
  }
}

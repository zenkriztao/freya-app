import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/firestore_data/appointment_history_list.dart';
import 'package:freya/globals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';

import 'setting.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  final FirebaseStorage storage = FirebaseStorage.instance;

  // details
  String? email;
  String? name;
  String? phone;
  String? bio;
  String? specialization;
  // default dp
  String image =
      'https://i.ibb.co/HDV0P5N/Whats-App-Image-2023-05-28-at-19-46-02.jpg';

  Future<void> _getUser() async {
    user = _auth.currentUser!;

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection(isDoctor ? 'doctor' : 'patient')
        .doc(user.uid)
        .get();

    setState(() {
      var snapshot = snap.data() as Map<String, dynamic>;
      email = snapshot['email'];
      name = snapshot['name'];
      phone = snapshot['phone'];
      bio = snapshot['bio'];
      image = snapshot['profilePhoto'] ?? image;
      specialization = snapshot['specialization'];
    });
    print(snap.data());
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
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, right: 7),
                          alignment: Alignment.topRight,
                          // edit user info button
                          child: IconButton(
                            icon: const Icon(
                              Iconsax.setting_2,
                              color: Colors.black,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserSettings(),
                                ),
                              ).then((value) {
                                // reload page
                                _getUser();
                                setState(() {});
                              });
                            },
                          ),
                        ),
                      ),
                      // user name
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 4,
                        padding: const EdgeInsets.only(top: 120),
                        child: Text(
                          name ?? 'Name Not Added',
                          style: GoogleFonts.nunito(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // user image
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFCB5C6C),
                          width: 5,
                        ),
                        shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {
                        _showSelectionDialog(context);
                      },
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: const Color.fromARGB(255, 126, 86, 86),
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // user basic info
              // Container(
              //   margin: const EdgeInsets.only(left: 15, right: 15),
              //   padding: const EdgeInsets.only(left: 20),
              //   height: MediaQuery.of(context).size.height / 7,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // user email
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Colors.red[900],
              //               child: const Icon(
              //                 Icons.mail_rounded,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             user.email ?? 'Email Not Added',
              //             style: GoogleFonts.nunito(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.black54,
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       // user phone number
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Color(0xFFE35970),
              //               child: const Icon(
              //                 Icons.phone,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             phone ?? 'Not Added',
              //             style: GoogleFonts.nunito(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.black54,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              // // user bio
              // Container(
              //   margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              //   padding: const EdgeInsets.only(left: 20, top: 20),
              //   height: MediaQuery.of(context).size.height / 7,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Color(0xFFE35970),
              //               child: const Icon(
              //                 Icons.edit,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             'Bio',
              //             style: GoogleFonts.nunito(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ],
              //       ),
              //       // bio
              //       Container(
              //         alignment: Alignment.centerLeft,
              //         padding: const EdgeInsets.only(top: 10, left: 40),
              //         child: Text(
              //           bio ?? 'Not Added',
              //           style: GoogleFonts.nunito(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.black38,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              // Appointment history
            ],
          ),
        ),
      ),
    );
  }

  // for picking image from device
  Future selectOrTakePhoto(ImageSource imageSource) async {
    XFile? file =
        await ImagePicker().pickImage(source: imageSource, imageQuality: 12);

    if (file != null) {
      var im = await file.readAsBytes();
      // upload image to cloud
      await uploadFile(im, file.name);
      return;
    }

    print('No photo was selected or taken');
  }

  // dialog for option of take photo from
  Future _showSelectionDialog(BuildContext conntext) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select photo'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('From gallery'),
              onPressed: () {
                selectOrTakePhoto(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text('Take a photo'),
              onPressed: () {
                selectOrTakePhoto(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // upload image
  Future uploadFile(Uint8List img, String fileName) async {
    final destination = 'dp/${user.displayName}-$fileName';
    try {
      final ref = storage.ref(destination);

      UploadTask uploadTask = ref.putData(img);
      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();
      print('image url : $downloadUrl');

      setState(() {
        image = Uri.decodeFull(downloadUrl.toString());
      });
      FirebaseFirestore.instance
          .collection(isDoctor ? 'doctor' : 'patient')
          .doc(user.uid)
          .set({
        'profilePhoto': downloadUrl,
      }, SetOptions(merge: true));

      // main user data
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'profilePhoto': downloadUrl,
      }, SetOptions(merge: true));

      print("uploaded !!!");
    } catch (e) {
      print(e.toString());
      print('error occured');
    }
  }
}

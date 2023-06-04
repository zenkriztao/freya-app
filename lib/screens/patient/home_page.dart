import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freya/emergency_banner.dart';
import 'package:freya/screens/tweet/main_tweet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/card_carousel.dart';
import 'package:freya/carousel_slider.dart';
import 'package:freya/firestore_data/notification_list.dart';
import 'package:freya/firestore_data/search_list.dart';
import 'package:freya/firestore_data/top_rated_list.dart';
import 'package:freya/model/card_model.dart';
import 'package:freya/screens/explore_list.dart';
import 'package:freya/screens/tweet/tweets.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _doctorName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    _doctorName = TextEditingController();
  }

  @override
  void dispose() {
    _doctorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String message = "Good";
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          message = 'Good Afternoon';
        } else {
          message = 'Good Night';
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Color(0xFFE35970),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: Container(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  message,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                width: 55,
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Iconsax.notification),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => const NotificationList()));
                },
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
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
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.search,
                      controller: _doctorName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Search psychologists',
                        hintStyle: GoogleFonts.nunito(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        suffixIcon: Container(
                          decoration: BoxDecoration(),
                          child: IconButton(
                            iconSize: 28,
                            splashRadius: 20,
                            color: Colors.black,
                            icon: const Icon(Iconsax.search_normal),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      onFieldSubmitted: (String value) {
                        setState(
                          () {
                            value.isEmpty
                                ? Container()
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchList(
                                        searchKey: value,
                                      ),
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      "Hi, ${user?.displayName}",
                      style: GoogleFonts.nunito(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 146, 32, 51),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Text(
                      "Let's Find Your\nPsychologists",
                      style: GoogleFonts.nunito(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What do you need?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color(0xFFE35970),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const CardCarousel(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Campanye and Support Women",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 131, 91, 91),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Carouselslider(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tweets",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 131, 91, 91),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Tweets(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainTweet()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE35970), // Ubah warna latar belakang tombol menjadi merah
                    ),
                    child: Text('Make Tweet'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Emergency Number",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 131, 91, 91),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const EmergencyBanner(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Pyschologists",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          color: Color(0xFFE35970),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const TopRatedList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

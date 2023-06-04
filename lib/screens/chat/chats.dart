import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/screens/chat/chat_dao.dart';
import 'package:freya/screens/chat/chat_room.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final ScrollController _scrollController = ScrollController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late var chatDao;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  Future<void> _set() async {
    chatDao = ChatDao(user.uid);
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    _set();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE35970),
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Chat Counselor',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [_getChatList()],
        ),
      ),
    );
  }

  Widget _getChatList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: chatDao.getChatQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          print('ok:' + json.toString());
          return ChatCard(
              userId: json['uid'] ?? 'No id',
              profileUrl: json['photo'] ?? " ",
              userName: json['name'] ?? 'Not Set');
        },
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String userId;
  final String profileUrl;
  final String userName;
  const ChatCard(
      {Key? key,
      required this.userId,
      required this.profileUrl,
      required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 14),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
                  builder: (context) => ChatRoom(
                      user2Id: userId,
                      user2Name: userName,
                      profileUrl: profileUrl),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                  backgroundColor: Color(0xFFBF717E),
                  radius: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Counselor Expert for Women",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

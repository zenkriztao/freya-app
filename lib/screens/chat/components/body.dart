import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 60, 92),
        title: Text(
          'Sarah Mintas',
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  );
                } else {}
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 190, 190),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 163, 59, 59),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/send_icon.svg",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

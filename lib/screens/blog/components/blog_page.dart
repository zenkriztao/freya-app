import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 170, 83, 77),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Don\'t be afraid \n Speak up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 17, 17),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'for most people it is a disgrace. One day I told my wife that I was feeling symptoms of depression. Oh, he\'s mad at me. He thought I thought too much, lacked worship, blah blah… he said so much. \n\nEven though I need help. Even when I take anti-depressants and complain, I still get angry. He thought I was lazy even though the sedative effect of the drug really couldn\'t be saved. \n\nThat\'s why it\'s very natural that many people prefer bundir rather than trying to get help because there are still many of us who think mental health is not important. The general opinion is that people with mental health disorders are weak and fragile. \n\nVery different from people who suffer from cancer or heart who will definitely get more sympathy and support.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/test.png',
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

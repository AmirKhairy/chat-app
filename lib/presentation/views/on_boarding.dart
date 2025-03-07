import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:chat_app/presentation/widgets/login_widgets/image_widget.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  List<Widget> messages = [
    RightMessageWidget(
      text: '😢 انا زعلان منك',
    ),
    LeftMessageWidget(
      text: '🤔 زعلان ليه ',
    ),
    RightMessageWidget(
      text: '😩 علشان مبتسألش عليا',
    ),
    LeftMessageWidget(
      text: '😢 وانا كمان زعلان منك',
    ),
    RightMessageWidget(
      text: '🤔 زعلان ليه',
    ),
    LeftMessageWidget(
      text: '😩 علشان مبتسألش عليا',
    ),
    RightMessageWidget(
      text: '🤗 طب متيلا نسأل علي بعض',
    ),
    LeftMessageWidget(
      text: '🤗 يلا بيا',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'ChitChat',
                style: TextStyle(
                  fontSize: 32,
                  color: kPrimaryColor,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            currentIndex != 0
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return messages[index];
                      },
                      itemCount: currentIndex,
                    ),
                  )
                : Text(
                    'Start Chatting',
                    style: TextStyle(
                      fontSize: 32,
                      color: kPrimaryColor,
                      fontFamily: 'Pacifico',
                    ),
                  ),
            GestureDetector(
              onTap: () {
                if (currentIndex < messages.length) {
                  setState(() {
                    currentIndex++;
                  });
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: currentIndex == messages.length
                        ? Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        : Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightMessageWidget extends StatelessWidget {
  const RightMessageWidget({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LeftMessageWidget extends StatelessWidget {
  const LeftMessageWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Color(0xff97aec7),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            bottomEnd: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

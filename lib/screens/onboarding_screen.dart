import 'package:flutter/material.dart';
import 'package:sport_hangly/widgets/onboarding_items.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ignore: prefer_final_fields
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;

  final List<String> titles = [
    "Welcome",
    "Awesome App",
    "Flutter App",
  ];

  final List<String> subtitles = [
    "Welcome to this awesome intro screen app.",
    "This is an awesome app, of intro screen design",
    "Flutter is awesome for app development"
  ];

  final List<Color> colors = [
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.indigo.shade300,
  ];

  final List<String> images = [
    "assets/4.png",
    "assets/5.png",
    "assets/7.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return OnboardingItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: images[index],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              // ignore: deprecated_member_use
              child: FlatButton(
                child: const Text("Skip"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon:
                    Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
                onPressed: () {
                  if (_currentIndex != 2)
                    _controller.next();
                  else
                    Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

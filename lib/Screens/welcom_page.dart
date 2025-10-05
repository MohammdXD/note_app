import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:note_app/generated/l10n.dart';
import 'package:note_app/main.dart';

class WelcomPage extends StatefulWidget {
  WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  int _currentIndex = 0;

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<String> images = [
    "assest/images/8844617c76d94c9886878ed0d7cc.png",
    "assest/images/360_F_463749911_s9Pq4Lki9zJTviKI4YhVnjVlH70VetAC.png",
    "assest/images/ac7bed97333277.5ec2cda43f20f.png",
    "assest/images/moushen.png",
  ];

  // Remove late final and initialize in build method instead
  List<List<String>> getSlideContent(BuildContext context) {
    return [
      [S.of(context).title_splash1, S.of(context).description_splash1],
      [S.of(context).title_splash2, S.of(context).description_splash2],
      [S.of(context).title_splash3, S.of(context).description_splash3],
      [S.of(context).title_splash4, S.of(context).description_splash4],
    ];
  }

  final List<List<Color>> gradients = [
    [Color(0xff151747), Color(0xff6d72c3)],
    [Color(0xffcd9cee), Color(0xffe9d1f5)],
    [Color(0xffc7c6d3), Color(0xffa6bffb)],
    [Color(0xffebe8e7), Color(0xffdf4f52)],
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final img in images) {
        precacheImage(AssetImage(img), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the translated content inside build method where context is available
    final slideContent = getSlideContent(context);

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradients[_currentIndex],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, Routes.note),
                    child: Text(
                      S.of(context).Skip,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 80),

            Expanded(
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: images.length,
                options: CarouselOptions(
                  height: 350,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                children: [
                  Text(
                    slideContent[_currentIndex].first,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    slideContent[_currentIndex].last,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 80),
                  Row(
                    children: List.generate(
                      images.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 20 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_currentIndex < images.length - 1) {
                        _carouselController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushNamed(context, Routes.note);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: gradients[_currentIndex].last,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(
                      _currentIndex == images.length - 1
                          ? S.of(context).Start
                          : S.of(context).Next,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

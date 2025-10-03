import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:note_app/main.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06185a),
      appBar: AppBar(
        backgroundColor: Color(0xff06185a),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xff06185a),
              ),
              shape: MaterialStateProperty.all<LinearBorder>(LinearBorder.none),
              elevation: MaterialStateProperty.all<double>(0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.note);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 200),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              enableInfiniteScroll: false,
              pauseAutoPlayOnManualNavigate: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsPk8G63Kbydbx0nUNPL5OUMRjNW9P_eSzhA&s",
                width: 250,
                height: 300,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4aTVbJ7eEVPQRnFzcoFBNmRe3kuJvhBxNcg&s",
                width: 250,
                height: 300,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9iFrP7ng2rgFfYQdT-tOxvUS40Wyy2MQS8A&s",
                width: 250,
                height: 300,
              ),
            ],
          ),
          SizedBox(height: 250),
          Row(
            children: [
              SizedBox(width: 170),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 45),
              SizedBox(
                height: 40,
                width: 100,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.note);
                  },
                  child: Text("Next", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0a3697),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

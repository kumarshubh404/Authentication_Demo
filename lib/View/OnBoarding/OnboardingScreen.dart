import 'dart:async';
import 'package:authentication_demo/View/Login_Screen/Welcome_Screen.dart';
import 'package:flutter/material.dart';
import '../../ViewModel/OnBoardViewModel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_OnBoarding_Screen();
}

class _OnBoarding_Screen extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  void handleButtonTap() {
    print("Image button tapped!");
    // Action
    if (_pageIndex < 2) {
      _pageIndex++;
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    }

    _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(microseconds: 450),
        curve: Curves.easeIn
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer){

    });

    @override
    void dispose() {
      // Dispose everything
      _pageController.dispose();
      _timer!.cancel();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Carousel area
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                  onTap: handleButtonTap,
                ),
              ),
            ),
            // Button area

          ],
        ),
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  });

  String image;
  String title;
  String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
         width: double.infinity,
          height: double.infinity,
          child: Image.asset(image,
            fit: BoxFit.fill,
        ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                    ),
                  ),
                  height: 328,
                  width: double.infinity,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const SizedBox(
                      height: 57,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                   // Spacer(),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Stack(
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: onTap,
                              child: const Text('Skip >>', style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange
                              ),),
                            ),
                          ),
                          // Spacer(),
                          Positioned(
                            top: -10,
                            right: 30,
                            child:
                              IconButton(
                                icon: Image.asset('assets/images/next.png'),
                                onPressed: onTap,
                                // adjust size as needed
                                splashRadius: 24, // optional
                              )
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    // )
                  ],
                ),
              ],
            )
          ],
        ),
      ]
    );
  }
}

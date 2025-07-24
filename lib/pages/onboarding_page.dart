import 'package:flutter/material.dart';
import 'package:netflix/pages/signin_page.dart';
import 'package:netflix/widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        leading: const Image(image: AssetImage("assets/images/symbol.png")),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "PRIVACY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "SIGN IN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              Onboarding(
                title: "Unlimited movies, TV shows, and more",
                subtitle: "Watch anywhere, Cancel anytime",
                image: 'assets/images/ob3.jpg',
              ),
              Onboarding(
                title: "There is a plan for every fan",
                subtitle: "plan start at \$2.99 /month",
                image: 'assets/images/ob2.jpg',
              ),
              Onboarding(
                title: "Cancel online anytime",
                subtitle: "Join today , no reason to wait",
                image: 'assets/images/ob1.jpg',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(20),
                      height: 10,
                      width: currentPage == index ? 20 : 10,
                      decoration: BoxDecoration(
                        color: currentPage == index ? Colors.red : Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("get started"),
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

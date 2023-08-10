import 'package:flutter/material.dart';

// 1. Create object class
class OnboardingItem {
  const OnboardingItem(this.imgPath, this.title, this.detail);

  final String imgPath;
  final String title;
  final String detail;
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // 2. Declare Object List
  List<OnboardingItem> items = [
    const OnboardingItem(
      'assets/images/hello.png',
      'Welcome to KKAMPANG',
      'We are happy to have you here',
    ),
    const OnboardingItem(
      'assets/images/portfolio.png',
      'Design Template Uploads\nEvery Tuesday',
      'Be sure to check out\nmy profile for more updates',
    ),
    const OnboardingItem(
      'assets/images/download.png',
      'Download Now',
      'Our new app is in town!',
    ),
  ];

  int index = 0;

  void next() {
    if (index >= 2) {
      Navigator.pushReplacementNamed(context, 'navbar');
      return;
    }
    setState(() {
      index++;
    });
  }

  void previous() {
    if (index <= 0) {
      return;
    }
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade50,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // 3. Pass `items` data
                _OnboardingBody(
                  imgPath: items[index].imgPath,
                  title: items[index].title,
                  detail: items[index].detail,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: previous,
                      child: Text(index > 0 ? 'Previous' : ''),
                    ),
                    const Spacer(),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.grey : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.grey : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: index == 2 ? Colors.grey : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: next,
                      child: const Text('Next'),
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

class _OnboardingBody extends StatelessWidget {
  const _OnboardingBody({
    required this.imgPath,
    required this.title,
    required this.detail,
  });

  final String imgPath;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(150),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(imgPath),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          detail,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

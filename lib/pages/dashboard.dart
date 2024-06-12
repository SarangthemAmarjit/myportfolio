import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 219, 226, 225),
                Color.fromARGB(255, 232, 227, 227),
                Color(0xFFF5F5F5),
                Color.fromARGB(255, 227, 216, 204),
                Color.fromARGB(255, 201, 190, 189)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isSmallScreen = constraints.maxWidth < 800;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Header Row with TabBar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'My Portfolio',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (!isSmallScreen)
                                  Row(
                                    children: [
                                      const TabBar(
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        dividerHeight: 100,
                                        dividerColor: Colors.transparent,
                                        automaticIndicatorColorAdjustment: true,
                                        isScrollable: true,
                                        unselectedLabelStyle:
                                            TextStyle(fontSize: 15),
                                        labelColor: Colors.teal,
                                        indicator: BoxDecoration(),
                                        unselectedLabelColor: Colors.black,
                                        tabs: [
                                          Tab(
                                            text: 'About',
                                          ),
                                          Tab(text: 'Services'),
                                          Tab(text: 'My Work'),
                                          Tab(text: 'Blog'),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: const StadiumBorder(),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                        ),
                                        child: const Text('Hire Me'),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // TabBarView
                            Expanded(
                              child: TabBarView(
                                children: [
                                  buildAboutTab(isSmallScreen),
                                  buildServicesTab(),
                                  buildMyWorkTab(),
                                  buildBlogTab(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAboutTab(bool isSmallScreen) {
    return isSmallScreen
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Developer Image
                Image.asset(
                  'assets/images/developer.png',
                  height: 250,
                ),
                const SizedBox(height: 20),
                // Text and Buttons
                buildTextColumn(),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: Text and buttons
              Expanded(
                flex: 1,
                child: buildTextColumn(),
              ),
              // Right side: Image
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/developer.png'),
                ),
              ),
            ],
          );
  }

  Widget buildServicesTab() {
    return const Center(
      child: Text(
        'Services',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMyWorkTab() {
    return const Center(
      child: Text(
        'My Work',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildBlogTab() {
    return const Center(
      child: Text(
        'Blog',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Column buildTextColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hi, I am John Deo',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Freelancer | Fullstack Developer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: const Text('See My Work'),
        ),
      ],
    );
  }
}

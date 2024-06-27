import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> with TickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 5,
    );
  }

  void _onTabChanged() {
    setState(() {
      _selectedIndex = _tabController!.index;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController?.addListener(_onTabChanged);
    return Scaffold(
      backgroundColor: Colors.white,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        TabBar(
                                          controller: _tabController!,
                                          labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          dividerHeight: 100,
                                          dividerColor: Colors.transparent,
                                          automaticIndicatorColorAdjustment:
                                              true,
                                          isScrollable: true,
                                          unselectedLabelStyle:
                                              const TextStyle(fontSize: 15),
                                          labelColor: Colors.teal,
                                          indicator: const BoxDecoration(),
                                          unselectedLabelColor: Colors.black,
                                          tabs: const [
                                            Tab(
                                              text: 'Home',
                                            ),
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
                              const Text(
                                'Freelancer | Fullstack Developer',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // TabBarView
                          Expanded(
                            child: PageTransitionSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (
                                Widget child,
                                Animation<double> primaryAnimation,
                                Animation<double> secondaryAnimation,
                              ) {
                                return FadeThroughTransition(
                                  fillColor: Colors.white,
                                  animation: primaryAnimation,
                                  secondaryAnimation: secondaryAnimation,
                                  child: child,
                                );
                              },
                              child: IndexedStack(
                                key: ValueKey<int>(_selectedIndex),
                                index: _selectedIndex,
                                children: [
                                  buildHomeTab(isSmallScreen),
                                  buildAboutTab(),
                                  buildServicesTab(),
                                  buildMyWorkTab(),
                                  buildBlogTab(),
                                ],
                              ),
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
    );
  }

  Widget buildHomeTab(bool isSmallScreen) {
    return isSmallScreen
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Developer Image
                Image.asset(
                  'assets/images/me.png',
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
                  child: Image.asset('assets/images/me.png'),
                ),
              ),
            ],
          );
  }

  Widget buildAboutTab() {
    return const Center(
      child: Text(
        'About',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
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
          'Welcome to My Portfolio',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
            text: 'Hello! I\'m ',
            style: TextStyle(
                letterSpacing: 0.5,
                wordSpacing: 0.3,
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'KulimPark'),
            children: <TextSpan>[
              TextSpan(
                text: 'Sarangthem Amarjit Meetei',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              TextSpan(
                text:
                    ', a passionate full-stack software developer with expertise in building scalable and efficient web and mobile applications. With a strong foundation in both front-end and back-end technologies, I create seamless digital experiences from concept to deployment. Explore my projects, skills, and contact me for collaboration opportunities.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onHover: (value) {},
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: Colors.teal,
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

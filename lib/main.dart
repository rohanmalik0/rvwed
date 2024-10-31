import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rvwed/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(WeddingWebsite());
}

class WeddingWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var json = [
    {
      "back": "assets/images/backwhite.jpg",
      "image": "assets/images/rvs.png",
      "loc": "https://maps.app.goo.gl/J7r3rB4HssiRPqoX9"
    },
    {
      "back": "assets/images/haldiback3.jpg",
      "image": "assets/images/rvtt.png",
      "loc": "https://maps.app.goo.gl/jiaV9mJRWWJcf63n7"
    },
    {
      "back": "assets/images/backw.jpg",
      "image": "assets/images/rv2.png",
      "loc": "https://maps.app.goo.gl/mJWMxaSUapuWHtKd7"
    }
  ];
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    StepperType stepperType =
        isMobile ? StepperType.vertical : StepperType.vertical;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     'Aditi & Ravi’s Wedding',
      //     style: TextStyle(
      //       color: Colors.deepOrangeAccent,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Color(0xFFFFE4E1),
      //   elevation: 0,
      //   actions: [
      //     _buildNavButton('Home'),
      //     _buildNavButton('Gallery'),
      //     _buildNavButton('Events'),
      //     _buildNavButton('RSVP'),
      //     _buildNavButton('Contact Us'),
      //   ],
      // ),

      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        json[index]['back'] ?? "",
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Colors.red.withOpacity(
                                0.1), // Adjust color opacity as needed
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // launchUrl(Uri.parse(json[index]['loc'] ?? ""));

                          await launchUrlString(json[index]['loc'] ?? "");
                        },
                        child: Container(
                          height: screenWidth > 600 ? 70.h : 42.h,
                          width: screenWidth > 600 ? 60.w : 90.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(2, 2),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(json[index]['image'] ?? ""))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenWidth > 600 ? 10.h : 2.h,
                              ),
                              // Card(
                              //   surfaceTintColor: Colors.white,
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //         vertical: 20, horizontal: 20),
                              //     child: Column(
                              //       children: [
                              //         Text(
                              //           "Riya & Viren Wedding",
                              //           style: GoogleFonts.greatVibes(
                              //             fontSize: 36,
                              //             fontWeight: FontWeight.w600,
                              //             color: pink, // Gold
                              //           ),
                              //         ),
                              //         SizedBox(height: 16),
                              //         Text(
                              //           "Join us to celebrate the journey of love and togetherness",
                              //           style: GoogleFonts.merriweather(
                              //             fontSize: 18,
                              //             color: Color(0xFFFFE4E1), // Ivory White
                              //           ),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      index == 2
                          ? Positioned(
                              bottom: 15.h,
                              child: Text(
                                "|| वक्रतुंड महाकाय सूर्यकोटि समप्रभ,\n निर्विघ्नं कुरु मे देव सर्वकार्येषु सर्वदा ||",
                                style: GoogleFonts.tiroDevanagariHindi(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w800),
                              ))
                          : Container()
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1, height: 100.h, autoPlay: true)),

          Container(
            height: 100.h,
            width: 100.w,
            color: const Color.fromARGB(45, 255, 129, 104),
            child: Column(
              children: [
                SizedBox(
                  height: screenWidth > 600 ? 10.h : 2.h,
                ),
                Center(
                  child: Text(
                    "#RiViKiShaadi",
                    style: GoogleFonts.pottaOne(
                      fontSize: screenWidth > 600 ? 36 : 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black, // Gold
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth > 600 ? 5.h : 2.h,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "When two worlds come together, love weaves a colorful tapestry of traditions and joy. Her spirited charm meets his steady grace, blending customs and heartfelt moments into a celebration like no other. The two gentle souls found each other, a quiet yet profound love story unfolded. Their shared warmth and unspoken understanding blend seamlessly, creating a wedding that celebrates the beauty of simplicity and closeness. With every moment, this union promises a lifetime of quiet joys, tender glances, and traditions honored with love.This wedding promises laughter, warmth, and the magic of two hearts and cultures joining as one.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.molengo(
                        fontSize: screenWidth > 600 ? 20 : 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, // Gold
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: 55.h,
                        width: screenWidth > 600 ? 30.w : 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/$index.jpeg'))),
                      );
                    },
                    options: CarouselOptions(
                        height: 55.h,
                        autoPlay: true,
                        enlargeFactor: 0.5,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        viewportFraction: screenWidth > 600 ? 0.4 : 0.9))
              ],
            ),
          ),
          // Container(
          //   height: 100.h,
          //   width: 100.w,
          //   color: const Color.fromARGB(45, 255, 129, 104),
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Image.asset(
          //         _currentStep == 0
          //             ? "assets/images/back.jpg"
          //             : _currentStep == 1
          //                 ? "assets/images/mehendi.jpg"
          //                 : _currentStep == 2
          //                     ? "assets/images/turmeric.jpg"
          //                     : "assets/images/banner.jpg",
          //         width: 100.w,
          //         height: 100.h,
          //         fit: BoxFit.cover,
          //       ),
          //       Positioned.fill(
          //         child: BackdropFilter(
          //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //           child: Container(
          //             color: Colors.red
          //                 .withOpacity(0.1), // Adjust color opacity as needed
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: isMobile ? 90.w : 60.w,
          //         height: isMobile ? 80.h : 80.h,
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.white.withOpacity(0.1),
          //               borderRadius: BorderRadius.circular(30)),
          //           child: Column(
          //             children: [
          //               SizedBox(
          //                 height: screenWidth > 600 ? 5.h : 2.h,
          //               ),
          //               Center(
          //                 child: Text(
          //                   "EVENTS & CELEBRATIONS",
          //                   style: GoogleFonts.vibur(
          //                     fontSize: screenWidth > 600 ? 36 : 24,
          //                     fontWeight: FontWeight.w600,
          //                     color: Colors.black, // Gold
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: screenWidth > 600 ? 5.h : 2.h,
          //               ),
          //               Center(
          //                 child: Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //                   child: Text(
          //                     "The Malik and Gupta families eagerly await your presence to celebrate with us!",
          //                     style: GoogleFonts.gamjaFlower(
          //                       fontSize: screenWidth > 600 ? 24 : 12,
          //                       fontWeight: FontWeight.w600,
          //                       color: Colors.black, // Gold
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5.h,
          //               ),
          //               Theme(
          //                 data: ThemeData(canvasColor: Colors.transparent),
          //                 child: SizedBox(
          //                   width: 100.w,
          //                   child: Stack(
          //                     children: [
          //                       Align(
          //                         alignment: Alignment.center,
          //                         child: SizedBox(
          //                           width: isMobile ? 100.w : 40.w,
          //                           child: Stepper(
          //                             connectorColor:
          //                                 MaterialStatePropertyAll(Colors.red),
          //                             type: stepperType,
          //                             steps: _buildSteps(isMobile),
          //                             currentStep: _currentStep,
          //                             onStepTapped: (int index) {
          //                               setState(() {
          //                                 _currentStep = index;
          //                               });
          //                             },
          //                             onStepContinue: () {
          //                               if (_currentStep < 3) {
          //                                 setState(() {
          //                                   _currentStep += 1;
          //                                 });
          //                               }
          //                             },
          //                             onStepCancel: () {
          //                               if (_currentStep > 0) {
          //                                 setState(() {
          //                                   _currentStep -= 1;
          //                                 });
          //                               }
          //                             },
          //                             elevation: 0, // Removes shadow
          //                             controlsBuilder: (BuildContext context,
          //                                     ControlsDetails details) =>
          //                                 Container(),
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )

          // _buildHeroSection(),
          // x(height: 20),
          // _buildWelcomeSection(),
          // SizedBox(height: 20),
          // _buildEventsSection(),
          // SizedBox(height: 20),
          // _buildGallerySection(),
          // SizedBox(height: 40),
          // _buildFooter(),
        ],
      ),
    );
  }

  List<Step> _buildSteps(bool isMobile) {
    return [
      _buildStep(
        title: "Sagan Ceremony / Engagement",
        date: "10 November 2024",
        time: "7 pm onwards",
        location: "Rajwada Palace ~ The Legend, Delhi",
        description:
            "B-33 Industrial Area, GT Karnal Road, Ashok Vihar, Delhi 110033",
        index: 0,
        isMobile: isMobile,
      ),
      _buildStep(
        title: "Mehandi / Dholki (Bride's invitation only)",
        date: "18 November 2024",
        time: "4 pm onwards",
        location: "At residence",
        description: "House no. 69, J & K Block, Laxmi Nagar, Delhi 110092",
        index: 1,
        isMobile: isMobile,
      ),
      _buildStep(
        title: "Turmeric Tales (Haldi Ceremony)",
        date: "19 November 2024",
        time: "10 AM onwards",
        location:
            "Swasthya Vihar Club, Block B, near Bharti Public School, Delhi 110092",
        description: "",
        index: 2,
        isMobile: isMobile,
      ),
      _buildStep(
        title: "Wedding",
        date: "20 November 2024",
        time: "8 pm onwards",
        location: "Rama Banquet Hall, Block E, Sector 52 Noida",
        description: "Ground floor, Metro Station Gate No. 3",
        index: 3,
        isMobile: isMobile,
      ),
    ];
  }

  Step _buildStep({
    required String title,
    required String date,
    required String time,
    required String location,
    required String description,
    required int index,
    required bool isMobile,
  }) {
    return Step(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _currentStep == index
                    ? _currentStep == 1
                        ? Color(0xFFffedac)
                        : _currentStep == 2
                            ? Colors.white
                            : _currentStep == 3
                                ? Colors.black
                                : Colors.redAccent.shade700
                    : Colors.black),
          ),
        ],
      ),
      content: Align(
        alignment: index.isEven
            ? (isMobile ? Alignment.centerLeft : Alignment.bottomLeft)
            : (isMobile ? Alignment.centerLeft : Alignment.bottomLeft),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                Colors.white.withOpacity(0.05), // Semi-transparent background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _currentStep == index ? Colors.black : Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                "Date: $date",
              ),
              Text("Time: $time"),
              Text("Location: $location"),
              if (description.isNotEmpty) Text("Details: $description"),
            ],
          ),
        ),
      ),
      isActive: _currentStep >= index,
    );
  }

  Widget _buildNavButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        Image.network(
          'https://example.com/hero-image.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 500,
        ),
        const Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            'Join Us in Celebrating Aditi & Ravi’s Wedding!',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to Our Wedding',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'We are thrilled to celebrate our love with all of you. Join us as we embark on this beautiful journey together.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEventsSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Events',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent,
            ),
          ),
          SizedBox(height: 10),
          // Replace with event details
          Text('Mehendi, Sangeet, Wedding Ceremony, Reception'),
        ],
      ),
    );
  }

  Widget _buildGallerySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gallery',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrangeAccent,
            ),
          ),
          const SizedBox(height: 10),
          // Sample gallery grid
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              6,
              (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage('https://example.com/gallery1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.deepOrangeAccent,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Phone: +91 12345 67890\nEmail: contact@aditiandraviwedding.com',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.white),
              SizedBox(width: 8),
              Icon(Icons.safety_check, color: Colors.white),
              SizedBox(width: 8),
              Icon(Icons.safety_check, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

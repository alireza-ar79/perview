import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perview/HomeController.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final controller = Get.put(HomeController());
    if (controller.isDark == true) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('About Us'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 65, 59, 59),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.04,
                  ),
                  Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:const Color.fromARGB(255, 26, 22, 22),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/img/about-us.jpg",
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          "About Us!",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.015,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'This application was created by Alireza Arbabi and Erfan Zafarshah, two students of Quchan University of Technology, in collaboration with respected professor Dr. Eskandari.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.telegram),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              '@alireza_ar79 && @erfan_zf',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.036,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.012),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mail),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              'Support@mail.com',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width * 0.036,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('About Us'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 7, 163, 241),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 128, 206, 245),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.04,
                  ),
                  Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 180, 241, 243),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/img/about-us.jpg",
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          "About Us!",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.015,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'This application was created by Alireza Arbabi and Erfan Zafarshah, two students of Quchan University of Technology, in collaboration with respected professor Dr. Eskandari.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.telegram),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              '@alireza_ar79 && @erfan_zf',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.036,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.012),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mail),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Text(
                              'Support@mail.com',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width * 0.036,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}


//old about_page

// class AboutPage extends StatefulWidget {
//   const AboutPage({super.key});

//   @override
//   State<AboutPage> createState() => _AboutPageState();
// }

// class _AboutPageState extends State<AboutPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('About Us'),
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 7, 163, 241),
//         ),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: Color.fromARGB(255, 128, 206, 245),
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height:40,
//               ),
//               Container(
//                 width: 400,
//                 height: 650,
                
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: Color.fromARGB(255, 180, 241, 243)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipRRect(
//                       child: Image.asset(
//                         "assets/img/about-us.jpg",
//                         width: 350,
//                       ),
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "About Us!",
//                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         'This application was created by Alireza Arbabi and Erfan Zafarshah, two students of Quchan University of Technology, in collaboration with respected professor Dr. Eskandari.',
//                         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                       ),
//                     ),
                    
//                     // Text("  Erfan Zafarshah and Alirez Arbabi designed this "),
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     // Text("these two people are students of Qochan"),
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     // Text("University, both of them are working in the"),
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     // Text(
//                     //     "field of designing mobile applications with the help of Flutter."),
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.telegram),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text('@alireza_ar79 && @erfan_zf',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                       ],
//                     ),
//                     SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.mail),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text('Support@mail.com',style: TextStyle(fontWeight: FontWeight.bold),),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }


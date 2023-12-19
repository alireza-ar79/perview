import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perview/HomeController.dart';

//New ProfilePage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    if (controller.isDark == false) {
      String name = 'AliReza Arbabi';
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Profile Page',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edite Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(Icons.verified)
              ],
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(35)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Icon(
                      //         Icons.arrow_back_ios_new_rounded,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //       child: Text(
                      //         'Profile',
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         print('Edeited Done!!');
                      //       },
                      //       child: Text(
                      //         'Edit Profile',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () => print('Upload Image:'),
                          child: Image.asset(
                            'assets/img/add-friend.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(77, 236, 212, 212),
                              filled: true,
                              hintText: "Username",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(211, 0, 0, 0)),
                              prefixIcon: const Icon(
                                Icons.person_2_sharp,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: const Icon(
                                Icons.arrow_right,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(77, 236, 212, 212),
                              filled: true,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(211, 0, 0, 0)),
                              prefixIcon: const Icon(Icons.lock_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon:
                                  const Icon(Icons.arrow_right, size: 40),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(77, 236, 212, 212),
                              filled: true,
                              hintText: "Email Address",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(211, 0, 0, 0)),
                              prefixIcon: const Icon(Icons.email_sharp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon:
                                  const Icon(Icons.arrow_right, size: 40),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            readOnly: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(77, 236, 212, 212),
                                filled: true,
                                hintText: "Log Out",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(211, 0, 0, 0)),
                                prefixIcon: const Icon(Icons.logout_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    icon: const Icon(
                                      Icons.arrow_right,
                                      size: 40,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      String name = 'AliReza Arbabi';
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Profile Page',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edite Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(Icons.verified)
              ],
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(35)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () => print('Upload Image:'),
                          child: Image.asset(
                            'assets/img/add-friend.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(77, 236, 212, 212),
                                filled: true,
                                hintText: "Username",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(211, 0, 0, 0)),
                                prefixIcon: const Icon(
                                  Icons.person_2_sharp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_right,
                                  size: 40,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(77, 236, 212, 212),
                                filled: true,
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(211, 0, 0, 0)),
                                prefixIcon: const Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon:
                                    const Icon(Icons.arrow_right, size: 40),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(77, 236, 212, 212),
                                filled: true,
                                hintText: "Email Address",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(211, 0, 0, 0)),
                                prefixIcon: const Icon(Icons.email_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon:
                                    const Icon(Icons.arrow_right, size: 40),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              readOnly: true,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(77, 236, 212, 212),
                                  filled: true,
                                  hintText: "Log Out",
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(211, 0, 0, 0)),
                                  prefixIcon: const Icon(Icons.logout_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                      icon: const Icon(
                                        Icons.arrow_right,
                                        size: 40,
                                      ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}


// Old ProfilePage

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     String name = 'AliReza Arbabi';
//     return SafeArea(
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.4,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 0, 270, 0),
//                       child: Text(
//                         'Profile',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           print('Edeited Done!!');
//                         },
//                         child: Text(
//                           'Edit Profile',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: Colors.white),
//                         ))
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 80),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(30),
//                       child: InkWell(
//                         onTap: () => print('Upload Image:'),
//                         child: Image.asset(
//                           'assets/img/add-friend.png',
//                           width: 120,
//                           height: 120,
//                         ),
//                       )),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   name,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Column(children: [
//                 // SizedBox(
//                 //   height: 55,
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 60),
//                     child: Container(
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                             decoration: InputDecoration(
//                               fillColor:
//                                   const Color.fromARGB(77, 236, 212, 212),
//                               filled: true,
//                               hintText: "Username",
//                               hintStyle: TextStyle(
//                                   color: Color.fromARGB(211, 0, 0, 0)),
//                               prefixIcon: Icon(
//                                 Icons.person_2_sharp,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               suffixIcon: Icon(
//                                 Icons.arrow_right,
//                                 size: 40,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextField(
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               fillColor:
//                                   const Color.fromARGB(77, 236, 212, 212),
//                               filled: true,
//                               hintText: "Password",
//                               hintStyle: TextStyle(
//                                   color: Color.fromARGB(211, 0, 0, 0)),
//                               prefixIcon: Icon(Icons.lock_outline),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               suffixIcon: Icon(Icons.arrow_right, size: 40),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextField(
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                             decoration: InputDecoration(
//                               fillColor:
//                                   const Color.fromARGB(77, 236, 212, 212),
//                               filled: true,
//                               hintText: "Email Address",
//                               hintStyle: TextStyle(
//                                   color: Color.fromARGB(211, 0, 0, 0)),
//                               prefixIcon: Icon(Icons.email_sharp),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               suffixIcon: Icon(Icons.arrow_right, size: 40),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextField(
//                             readOnly: true,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             decoration: InputDecoration(
//                                 fillColor:
//                                     const Color.fromARGB(77, 236, 212, 212),
//                                 filled: true,
//                                 hintText: "Log Out",
//                                 hintStyle: TextStyle(
//                                     color: Color.fromARGB(211, 0, 0, 0)),
//                                 prefixIcon: Icon(Icons.logout_sharp),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 suffixIcon: IconButton(
//                                     onPressed: () {
//                                       Navigator.pushNamed(context, '/login');
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_right,
//                                       size: 40,
//                                     ))),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
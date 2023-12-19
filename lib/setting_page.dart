import 'package:flutter/material.dart';
import 'package:perview/HomeController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

Future<void> _makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = false;
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 20,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isDarkModeEnabled
                  ? 'assets/img/Setting_Dark2.png'
                  : 'assets/img/s3.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkModeEnabled
                      ? const Color.fromARGB(226, 24, 23, 23)
                      : const Color.fromARGB(255, 221, 213, 213),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.dark_mode_sharp),
                    Text(
                      'Dark Mode is ${isDarkModeEnabled ? 'Enabled' : 'Disabled'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GetBuilder<HomeController>(
                      builder: (_) => Switch(
                        value: controller.isDark,
                        onChanged: (state) {
                          setState(() {
                            isDarkModeEnabled = state;
                            controller.changeTheme(state);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkModeEnabled
                      ? const Color.fromARGB(226, 24, 23, 23)
                      : const Color.fromARGB(255, 221, 213, 213),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.notifications_sharp),
                    Text(
                      'Notification is ${isNotificationEnabled ? 'Enabled' : 'Disabled'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: isNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          isNotificationEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/about'),
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkModeEnabled
                      ? const Color.fromARGB(226, 24, 23, 23)
                      : const Color.fromARGB(255, 221, 213, 213),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _makePhoneCall('09370361644');
              },
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkModeEnabled
                      ? const Color.fromARGB(226, 24, 23, 23)
                      : const Color.fromARGB(255, 221, 213, 213),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Old 


// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   bool isDarkModeEnabled = false;
//   bool isNotificationEnabled = false;
//   final controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     if (controller.isDark == true) {
//       return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: const Text('Setting'),
//           centerTitle: true,
//           elevation: 20,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/img/Setting_Dark2.png'),
//                 fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(226, 24, 23, 23),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Icon(Icons.dark_mode_sharp),
//                       Text(
//                         'Dark Mode is ${isDarkModeEnabled ? 'Enabled' : 'Disabled'}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       GetBuilder<HomeController>(
//                         builder: (_) => Switch(
//                           value: controller.isDark,
//                           onChanged: (state) {
//                             controller.changeTheme(state);
//                             print('printing $state');
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(226, 24, 23, 23),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Icon(Icons.notifications_sharp),
//                       Text(
//                         'Notification is ${isNotificationEnabled ? 'Enabled' : 'Disabled'}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       Switch(
//                         value: isNotificationEnabled,
//                         onChanged: (value) {
//                           setState(() {
//                             isNotificationEnabled = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(context, '/about'),
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(226, 24, 23, 23),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.info_sharp),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'About Us',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   _makePhoneCall('09370361644');
//                 },
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(226, 24, 23, 23),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.support_agent_sharp,
//                         size: 30,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'Support',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Setting'),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           elevation: 20,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/img/s3.jpeg'), fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(255, 221, 213, 213),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Icon(Icons.dark_mode_sharp),
//                       Text(
//                         'Dark Mode is ${isDarkModeEnabled ? 'Enabled' : 'Disabled'}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       GetBuilder<HomeController>(
//                         builder: (_) => Switch(
//                           value: controller.isDark,
//                           onChanged: (state) {
//                             controller.changeTheme(state);
//                             print('printing $state');
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(255, 221, 213, 213),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Icon(Icons.notifications_sharp),
//                       Text(
//                         'Notification is ${isDarkModeEnabled ? 'Enabled' : 'Disabled'}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       Switch(
//                         value: isNotificationEnabled,
//                         onChanged: (value) {
//                           setState(() {
//                             isNotificationEnabled = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(context, '/about'),
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(255, 221, 213, 213),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.info_sharp),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'About Us',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   _makePhoneCall('09370361644');
//                 },
//                 child: Container(
//                   width: 400,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(255, 221, 213, 213),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.support_agent_sharp,
//                         size: 30,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'Support',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

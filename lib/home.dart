import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:perview/profile_page.dart';
import 'package:perview/setting_page.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildPage(_currentIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          iconSize: 32,
          unselectedItemColor: const Color.fromARGB(255, 187, 167, 167),
          selectedItemColor: Colors.blue,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
              activeIcon: Icon(CupertinoIcons.settings),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_sharp),
                label: 'Profile',
                activeIcon: Icon(CupertinoIcons.person_alt_circle)),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                activeIcon: Icon(CupertinoIcons.search_circle)),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const SettingPage();
      case 1:
        return const ProfilePage();
      case 2:
        return const Home();
      case 3:
        return const Center(child: Text('محتوای صفحه جستجو'));
      default:
        return const Center(child: Text('صفحه مورد نظر یافت نشد.'));
    }
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<String> futureData;
  List? data;
  List imagesUrl = [];
  String uploadDate = '';

  @override
  void initState() {
    super.initState();
    futureData = fetchDataFromApi();
  }

  Future<String> fetchDataFromApi() async {
    try {
      var jsonData = await http
          .get(Uri.parse("https://alirezaarbabi.wiki/ESP32CAM/images.json"));
      var fetchData = jsonDecode(jsonData.body);

      if (mounted) {
        setState(() {
          data = fetchData;
          imagesUrl.clear();
          if (data!.isNotEmpty) {
            imagesUrl.add(data!.last['url']);
            // Extract and set the upload date
            uploadDate = data!.last['uploadDate'];
          }
        });
      }

      return "Success";
    } catch (e) {
      // Handle errors here
      print(e.toString());
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List of Images'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              // Display loading spinner while data is being fetched
              // child: CircularProgressIndicator(),
              child:
                  Lottie.asset('assets/img/loading.json', height: height * 0.3),
            );
          } else if (snapshot.hasError) {
            return Center(
              // Display error message
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Data has been successfully fetched, display the images
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: imagesUrl.length,
              itemBuilder: (BuildContext context, int index) {
                // Specify the desired width and height for the image
                double desiredWidth = 600.0;
                double desiredHeight = 300.0;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.network(
                        imagesUrl[index],
                        fit: BoxFit.contain, // or BoxFit.fill
                        width: desiredWidth,
                        height: desiredHeight,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Time:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            // Display the extracted upload date
                            uploadDate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         if (imagesUrl.isNotEmpty) {
                      //           _saveImage(context, imagesUrl.last);
                      //         } else {
                      //           print("No image to save");
                      //         }
                      //         print("save in gallery");
                      //         // _saveImage();
                      //       },
                      //       icon: const Icon(
                      //         Icons.save_alt,
                      //         size: 35,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 5,
                      //     ),
                      //     const Text(
                      //       'Save',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (imagesUrl.isNotEmpty) {
            _saveImage(context, imagesUrl.last);
          } else {
            print("No image to save");
          }
          print("Floatinf Action Button");
        },
        tooltip: 'Save Image',
        child: Icon(Icons.save_alt),
      ),
    );
  }
}

Future<void> _saveImage(BuildContext context, String imageUrl) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    // Download image
    final http.Response response = await http.get(Uri.parse(imageUrl));

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/image.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'Image saved to disk';
    }
  } catch (e) {
    message = 'An error occurred while saving the image';
  }

  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}

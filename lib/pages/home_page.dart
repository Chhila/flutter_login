import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../services/http_services.dart';
import '../services/token_manager.dart'; // Import the TokenManager to access SharedPreferences

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceWidth, _deviceHeight;
  String? _profileImageUrl;
  String? _profileName;
  bool _isLoading = false;
  String? _token;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _loadTokenAndFetchProfile();
  }

  // Load the token from SharedPreferences and fetch the profile
  Future<void> _loadTokenAndFetchProfile() async {
    Map<String, String?> credentials = await TokenManager.getCredentials();
    _token = credentials['token'];

    if (_token != null && _token != 'No token found') {
      _getProfile();
    } else {
      setState(() {
        _isLoading = false; // Set loading to false if no token is found
      });
      print('No token found, user might not be logged in');
    }
  }

  // Fetch the profile after the token is available
  Future<void> _getProfile() async {
    if (_token != null) {
      try {
        final profile = await HttpService.getProfile(_token!);
        setState(() {
          _profileImageUrl = profile['profileImageUrl'] ?? 'https://i.pravatar.cc/300';
          _profileName = profile['username'] ?? 'Unknown';
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print('Error fetching profile: $e');
      }
    }
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    await _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: _deviceHeight! * 0.15,
                      decoration: BoxDecoration(color: Colors.indigo[900], borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: AppBar(
                              centerTitle: true,
                              title: Text(
                                "My Profile",
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.transparent,
                              leading: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 15),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("https://i.pravatar.cc/300")),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 5),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Sry Chhila",
                            style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "012 345 678",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Register Date: 12 Oct 2024",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.person, color: Colors.indigo[900]),
                            ),
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.key, color: Colors.indigo[900]),
                            ),
                            title: Text(
                              "Change Password",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.change_circle_outlined,
                                color: Colors.indigo[900],
                              ),
                            ),
                            title: Text(
                              "Change Language",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.bookmark,
                                color: Colors.indigo[900],
                              ),
                            ),
                            title: Text(
                              "Help",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.bookmark,
                                color: Colors.indigo[900],
                              ),
                            ),
                            title: Text(
                              "Term & Conditons",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.verified_user,
                                color: Colors.indigo[900],
                              ),
                            ),
                            title: Text(
                              "Privacy Policy",
                              style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _deviceWidth! * 0.4,
                      height: _deviceWidth! * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(_profileImageUrl ?? "https://i.pravatar.cc/300"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to\nHome Page",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

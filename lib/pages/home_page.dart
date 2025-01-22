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
  bool _isLoading = true;
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

  // Future<void> _onRefresh() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   await _getProfile();
  // }

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
                    SizedBox(height: 10),
                    Text(
                      _profileName ?? 'Loading...',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

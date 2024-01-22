import 'package:flutter/material.dart';
import '../widgets/main_nabvar.dart';
import '../services/api.service.dart';
import '../widgets/button.dart';
import '../screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Diogo Pimenta";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final userDetails = await ApiService().getUserDetails();

    if (userDetails['success']) {
      setState(() {
        userName = userDetails['data']['username'];
      });
    } else {
      print('Error loading user data: ${userDetails['error']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF444A73),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(
                top: 200),
            child:
                SizedBox(),
          ),
          Text(
            'Nome: $userName',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),

          
          const SizedBox(height: 170),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              buttonText: 'Sing Out',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(),
    );
  }
}

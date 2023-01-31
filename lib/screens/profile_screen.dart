import 'package:flutter/material.dart';
import 'package:newsapp/api/models/student_model.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:newsapp/screens/about_screen.dart';
import 'package:newsapp/storage/shaerd_pref_controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 450,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    SharedPrefController.sharedPrefController.email[0]
                        .toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  SharedPrefController.sharedPrefController.email,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 450,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.redAccent,
                child: Icon(
                  (Icons.ad_units),
                  color: Colors.white,
                ),
              ),
              title: const Text('About App'),
              trailing: IconButton(
                  onPressed: () {
                    AppRouter.goToScreen(AboutScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 450,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.redAccent,
                child: Icon(
                  (Icons.logout),
                  color: Colors.white,
                ),
              ),
              title: const Text('LogOut'),
              trailing: IconButton(
                  onPressed: () async{
                    await Provider.of<ApiProvider>(context,listen: false).logout();
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

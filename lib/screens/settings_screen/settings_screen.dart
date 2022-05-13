import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/address_screen/address_screen.dart';
import 'package:panaux_customer/screens/faq_screen/faq_screen.dart';
import 'package:panaux_customer/screens/login/login_screen.dart';
import 'package:panaux_customer/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:panaux_customer/screens/profile_edit_screen/profile_edit_screen.dart';
import 'package:panaux_customer/screens/update_password/update_password.dart';
import 'package:panaux_customer/screens/wallet/wallet_screen.dart';
import 'controllers/logout_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  LogoutController logoutController = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'More',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          )),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            accountsTile('Profile', () {
              Get.to(const ProfileEditScreen());
            }, Icons.insert_drive_file),
            accountsTile('Manage Address', () {
              Get.to(const AddressScreen());
            }, Icons.location_on),
            accountsTile('Wallet', () {
              Get.to(const WalletScreen());
            }, Icons.account_balance_wallet),
            accountsTile('FAQ', () {
              Get.to(const FAQScreen());
            }, Icons.question_answer),
            accountsTile('Privacy Policy', () {
              Get.to(const PrivacyPolicyScreen());
            }, Icons.policy),
            accountsTile('Change Password', () {
              Get.to(const UpdatePasswordScreen());
            }, Icons.password),
            accountsTile('Logout', () {
              Get.dialog(AlertDialog(
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                content: const Text("Are you sure you want to logout?"),
                actions: [
                  InkWell(
                    onTap: () {
                      logoutController.logOut().then(
                        (val) async {
                          Get.offAll(const LoginScreen());
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 16,
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ));
            }, Icons.logout),
          ],
        ),
      )),
    );
  }

  Widget accountsTile(String title, Function onTap, IconData icon) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                )),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              )
            ],
          ),
          const Divider(
            thickness: 0.4,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/wallet/controllers/wallet_controller.dart';

class WithdrawalPopup extends StatefulWidget {
  const WithdrawalPopup({Key? key}) : super(key: key);

  @override
  _WithdrawalPopupState createState() => _WithdrawalPopupState();
}

class _WithdrawalPopupState extends State<WithdrawalPopup> {
  WalletController controller=Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 350,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25
                  ),
                  child: const Text(
                    "Enter Amount of money you want to add",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.amount,
                    cursorColor: primaryColor,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.requestWithdrawal();
                      },
                      child: Container(
                        color: primaryColor,
                        height: 47,
                        width: 175,
                        child: const Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5)),
                            border: Border.all(color: primaryColor, width: 1),
                            color: Colors.white),
                        height: 47,
                        width: 175,
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

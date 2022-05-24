import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/doctor_appointment/doctor_appointment.dart';
import 'package:panaux_customer/screens/pharmacy/pharmacy_screen.dart';
import 'controllers/homescreen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.1),
              GestureDetector(
                onTap: (){Get.to(
                  const DoctorAppointment()
                );},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.calendar_today,
                              color: primaryColor,
                            )),
                        Expanded(
                            flex: 4,
                            child: Text(
                              'Doctor Appointment',
                              style: TextStyle(color: primaryColor, fontSize: 16),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const PharmacyScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.medical_services_outlined,
                              color: primaryColor,
                            )),
                        Expanded(
                            flex: 4,
                            child: Text(
                              'Pharmacy',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.search,
                            color: primaryColor,
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Diagnostic',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.add_circle_outline,
                            color: primaryColor,
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Medical Service',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.people_outline_rounded,
                            color: primaryColor,
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Parental Care',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.mode_edit_outline,
                            color: primaryColor,
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Medical Equipments',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

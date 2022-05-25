import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'doctor_profile.dart';
class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Doctor List',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: Get.height-100,
                  child: ListView(children: [
                    GestureDetector(
                      onTap:(){Get.to(const DoctorProfile());},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                          height:80,
                          child: Row(children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/doc.jpg'),
                              radius: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                              Text(
                                'Dr Rachana',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                                Text(
                                  'MS(Allopathy)',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'ahgd6sfiu478r6w487uifw87we487',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              Text(
                                '12 years experience',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),

                            ],)
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){Get.to(const DoctorProfile());},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                          height:80,
                          child: Row(children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/doc.jpg'),
                              radius: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Dr Rachana',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'MS(Allopathy)',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'ahgd6sfiu478r6w487uifw87we487',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '12 years experience',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),

                              ],)
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){Get.to(const DoctorProfile());},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                          height:80,
                          child: Row(children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/doc.jpg'),
                              radius: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Dr Rachana',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'MS(Allopathy)',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'ahgd6sfiu478r6w487uifw87we487',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '12 years experience',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),

                              ],)
                          ]),
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
        ),
      ),
    );
  }
}

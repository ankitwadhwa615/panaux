import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commons/constants.dart';
import 'controllers/doctor_appointment_controller.dart';
import 'doctor_profile.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    controller.getDoctorsList();
    super.initState();
  }

  DoctorAppointmentController controller =
      Get.put(DoctorAppointmentController());
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
          body:SingleChildScrollView(
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
                          Obx(()=>controller.gettingDoctors.value
                              ? Center(child:CircularProgressIndicator(
                            color: primaryColor,
                            backgroundColor: Colors.black12,
                            strokeWidth: 1.5,
                          ),)
                              : SizedBox(
                            height: Get.height-100,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.doctorsList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(DoctorProfile(
                                            data: controller.doctorsList[index],
                                          ));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15.0),
                                          child: SizedBox(
                                            height: 80,
                                            child: Row(children: [
                                               CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    controller.doctorsList[index].profilePicture??""),
                                                radius: 35,
                                                 backgroundColor: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children:  [
                                                  Text(
                                                    controller.doctorsList[index].name??"",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    controller.doctorsList[index].speciality??"",
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    controller.doctorsList[index].id??"",
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    controller.doctorsList[index].experience??"",
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )
                                            ]),
                                          ),
                                        ),
                                      );
                                    }
                          ),
                              ),  ),],),),
                  ),
        );
  }
}

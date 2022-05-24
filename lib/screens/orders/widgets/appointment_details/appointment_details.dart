import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.65,
              width: Get.width,
              child: Stack(children: [Image.asset('assets/images/doctorthree.jpg',fit:BoxFit.cover,),Positioned(top:25,left: 0,child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Get.back();},)),]),
            ),
            Padding(
              padding: const EdgeInsets.all( 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Doctor Information',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: primaryColor,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Test2',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: primaryColor,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'ankitwadhwa615@gmail.com',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Sickness Information',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Fever Fever Description',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Booking Information',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: primaryColor,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Appointment Time: 05:04 PM-05 May-2022',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [

                        Icon(
                          Icons.calendar_today_outlined,
                          color: primaryColor,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Booking Date: 16 May-2022',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_hospital,
                          color: primaryColor,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Booking Type: Direct Appointment (Offline)',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Status: Pending',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Call is not initiated by doctor yet',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

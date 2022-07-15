import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panaux_customer/commons/constants.dart';
// import 'package:panaux_customer/screens/video_call_screen/video_call_screen.dart';

import '../../models/booking_details_model.dart';

class AppointmentDetails extends StatefulWidget {
  final BookingModel data;
  const AppointmentDetails({Key? key,required this.data}) : super(key: key);

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
                        Text(
                          widget.data.doctor?.name??"",
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
                         Text(
                          widget.data.doctor?.email??"",
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        widget.data.description??"",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                         Flexible(
                           child: Text(
                            'Appointment Time: ${ DateFormat('hh:mm a').format(widget.data.appointmentTime!)}',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
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
                         Text(
                          'Booking Date: ${ DateFormat('dd MMM yyyy').format(widget.data.appointmentTime!)}',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                         Text(
                          'Booking Type: ${widget.data.appointmentMode}',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'Status: ${widget.data.status??""}',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Call is not initiated by doctor yet',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
	                Center(child: ElevatedButton(onPressed: () {
                    // Get.to(VideocallScreen());
                    }, child: Text('Start video call')))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/doctor_appointment/controllers/new_appointment_controller.dart';
import 'package:panaux_customer/screens/doctor_appointment/payment_screen.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  List<String> modes = [
    '---- Choose ----',
    'Online',
    'Offline'
  ];
  NewAppointmentController controller=Get.put(NewAppointmentController());
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
              children:  [
                const Text(
                  'New Appointment',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Problem',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  cursorColor: primaryColor,
                  style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                  validator: (val) {
                    // Check if this field is empty
                    if (val!.isEmpty) {
                      return 'Problem field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusColor: primaryColor,
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide:  BorderSide(color: primaryColor),
                    // ),
                    hintText: "Title",
                    hintStyle: const TextStyle(color: Colors.grey,fontSize: 15)
                  ),
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Problem Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  cursorColor: primaryColor,
                  style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                  validator: (val) {
                    // Check if this field is empty
                    if (val!.isEmpty) {
                      return 'Problem description field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide:  BorderSide(color: primaryColor),
                      // ),
                      hintText: "description",
                      hintStyle: const TextStyle(color: Colors.grey,fontSize: 15)
                  ),
                ),
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time_outlined,color: primaryColor,size: 30,),
                      const SizedBox(height: 5,),
                      const Text('(Select your date & time)',style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Appointment Mode:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                DropdownButtonFormField<String>(
                  value: controller.mode.value,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  validator: (value) =>
                  value == modes.first ? '---- Choose ----' : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      controller.mode.value = newValue!;
                    });
                  },
                  items: modes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Consultation Fee:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 50,),
                MaterialButton(height:40,minWidth:Get.width,onPressed: (){Get.to(const PaymentModeScreen());},color: primaryColor,child: const Text(
                  'PAY NOW',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),)
              ]),
        ),
      ),
    );
  }
}

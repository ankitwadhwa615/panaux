import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/create_appointment.dart';

class NewAppointmentController extends GetxController {
  RxString mode = '---- Choose ----'.obs;
  RxBool loading = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String appointmentTime = '';

  createAppointment(int appFees, String docId, String paymentMode) {
    loading.value = true;
    createAppointmentApi(
        title: title.text,
        description: description.text,
        appointmentFees: appFees,
        appointmentMode: mode.value,
        appointmentTime: appointmentTime,
        docId: docId,
        paymentType: paymentMode);
    loading.value = false;
  }
}

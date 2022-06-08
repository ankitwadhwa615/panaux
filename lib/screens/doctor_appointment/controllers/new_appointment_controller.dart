import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/models/razorpay_order_model.dart';
import '../apis/create_appointment.dart';

class NewAppointmentController extends GetxController {
  RxString mode = '---- Choose ----'.obs;
  RxBool loading = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String appointmentTime = '';
  RazorpayOrderModel? razorpayOrderModel;
  createRazorpayAppointment(int appFees, String docId) async{
    loading.value = true;
    razorpayOrderModel=await createAppointmentApi(
        title: title.text,
        description: description.text,
        appointmentFees: appFees,
        appointmentMode: mode.value,
        appointmentTime: appointmentTime,
        docId: docId);
    loading.value = false;
  }
  verifyRazorpayPaidAppointment(String paymentId,String orderId,String signature )async{
    print('verifying....');
    loading.value=true;
    await verifyRazorpayAppointmentApi(orderId,paymentId,signature);
    loading.value=false;
  }
}

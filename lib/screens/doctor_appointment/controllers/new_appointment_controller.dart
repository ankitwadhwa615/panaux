import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAppointmentController extends GetxController{
  RxString mode = '---- Choose ----'.obs;
  RxBool loading =false.obs;
  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController appointmentTime=TextEditingController();


  createAppointment(){

  }
}
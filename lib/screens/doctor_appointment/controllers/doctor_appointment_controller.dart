import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/doctor_appointment/apis/doctors_api.dart';
import 'package:ttsf_cloud/screens/doctor_appointment/models/doctor_model.dart';

class DoctorAppointmentController extends GetxController{
  RxBool gettingDoctors =true.obs;
  List<DoctorModel> doctorsList=[];
  getDoctorsList()async{
    doctorsList=await getDoctorsApi();
    gettingDoctors.value=false;
  }
}
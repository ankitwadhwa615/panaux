import 'package:get/get.dart';

import '../apis/prescriptions_api.dart';
import '../models/prescription_model.dart';


class PrescriptionController extends GetxController{
  RxBool gettingPrescription=false.obs;
  RxBool loading=false.obs;
  RxList<PrescriptionModel> prescriptions=<PrescriptionModel>[].obs;
  getPrescriptionList()async{
    gettingPrescription.value=true;
    prescriptions.value=await getPrescriptionApi();
    gettingPrescription.value=false;
  }
}
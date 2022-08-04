import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttsf_cloud/screens/pharmacy/apis/add_order_api.dart';
import 'package:ttsf_cloud/screens/pharmacy/models/pharmacy_model.dart';
import '../apis/get_pharmacy_api.dart';

class PharmacyController extends GetxController{
  RxBool gettingPharmacy =true.obs;
  List<PharmacyModel> pharmacyList=[];
  RxBool loading =false.obs;
  getPharmacyList()async{
    pharmacyList=await getPharmacyApi();
    pharmacyList.sort((a, b) => b.averageRating!.compareTo(a.averageRating!));
    gettingPharmacy.value=false;
  }

  XFile? prescription;
  createOrder(String vendorId)async{
    loading.value=true;
    await addOrderApi(prescription: prescription, vendorId: vendorId);
    getPharmacyList();
    loading.value=false;
  }
}
import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/privacy_policy_screen/apis/privacy_policy_api.dart';

class PrivacyController extends GetxController {
  RxBool loading = false.obs;
  RxString content = "".obs;

  privacyPolicy() async {
    loading.value = true;
    content.value = await privacyApi();
    if (content.value != '') {
      loading.value = false;
      // Fluttertoast.showToast(msg: 'Privacy Policy Loaded');
    } else {
      loading.value = false;
    }
    loading.value = false;
  }
}

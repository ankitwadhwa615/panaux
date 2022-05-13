import 'package:get/get.dart';
import 'package:panaux_customer/screens/faq_screen/apis/faq_api.dart';
import 'package:panaux_customer/screens/faq_screen/models/faq_model.dart';

class FaqController extends GetxController {
	RxBool loading = false.obs;
	RxList<FAQModel> faqList = <FAQModel>[].obs;

	faq() async {
		loading.value = true;
		faqList.value = await faqApi();
		if (faqList.isNotEmpty) {
			loading.value = false;
			// Fluttertoast.showToast(msg: 'FAQ Loaded');
		} else {
			loading.value = false;
		}
		loading.value = false;
	}
}
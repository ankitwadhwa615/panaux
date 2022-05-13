import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/screens/upload_documents_screen/apis/delete_document_api.dart';
import 'package:panaux_customer/screens/upload_documents_screen/apis/get_documents_api.dart';
import 'package:panaux_customer/screens/upload_documents_screen/apis/upload_documents_api.dart';
import 'package:panaux_customer/screens/upload_documents_screen/models/documents_model.dart';

class UploadDocumentController extends GetxController {
  RxBool loading = false.obs;
  Rx<XFile> idProof=XFile('').obs;
  Rx<XFile> certificate=XFile('').obs;
  RxBool documentsUploaded = false.obs;
  DocumentsModel? documentsModel;

  uploadDocument() async {
    loading.value = true;
    await uploadDocumentApi(
        idProofFile: idProof.value, certificateFile: certificate.value);
    loading.value = false;
  }

  getDocuments() async {
    loading.value = true;
    documentsModel = await getDocumentApi();
    loading.value = false;
  }
  deleteDocument(String type) async {
    loading.value = true;
    await deleteDocumentApi(
        type: type);
    loading.value = false;
  }
  updateData(){
    update();
  }
}

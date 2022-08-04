import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/faq_screen/controllers/faq_controller.dart';
import 'package:ttsf_cloud/screens/faq_screen/models/faq_model.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  FaqController controller = Get.put(FaqController());

  @override
  void initState() {
    controller.faq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.loading.value,
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 1.5,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  "FAQ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Center(
                child: Obx(() => ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          controller.faqList[index].isExpanded = !isExpanded;
                        });
                      },
                      children: controller.faqList
                          .map<ExpansionPanel>((FAQModel item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                            );
                          },
                          body: ListTile(
                            title: Text(item.expandedValue),
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

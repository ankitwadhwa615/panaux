import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/doctor_appointment/controllers/new_appointment_controller.dart';
import 'package:ttsf_cloud/screens/doctor_appointment/models/doctor_model.dart';
import 'package:ttsf_cloud/screens/doctor_appointment/payment_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class NewAppointment extends StatefulWidget {
  final DoctorModel data;
  const NewAppointment({Key? key, required this.data}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
    _selectTime(context);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        timeController.text = _time;
        timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
      controller.appointmentTime = selectedDate
          .add(Duration(
          hours: selectedTime.hour,
          minutes: selectedTime.minute))
          .toString();
    }
  }

  @override
  void initState() {
    dateController.text = DateFormat.yMd().format(DateTime.now());

    timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  List<String> modes = ['---- Choose ----'];
  NewAppointmentController controller = Get.put(NewAppointmentController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    if (widget.data.commission?.online != null &&
        widget.data.commission?.offline != null) {
      modes = ['---- Choose ----', 'Online', 'Offline'];
    } else if (widget.data.commission?.online != null &&
        widget.data.commission?.offline == null) {
      modes = ['---- Choose ----', 'Online'];
    } else if (widget.data.commission?.online == null &&
        widget.data.commission?.offline != null) {
      modes = ['---- Choose ----', 'Offline'];
    } else {
      modes = ['---- Choose ----'];
    }
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
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'New Appointment',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Problem',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        controller: controller.title,
                        cursorColor: primaryColor,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        validator: (val) {
                          // Check if this field is empty
                          if (val!.isEmpty) {
                            return 'Problem field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusColor: primaryColor,
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide:  BorderSide(color: primaryColor),
                            // ),
                            hintText: "Title",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Problem Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        controller: controller.description,
                        cursorColor: primaryColor,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        validator: (val) {
                          // Check if this field is empty
                          if (val!.isEmpty) {
                            return 'Problem description field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusColor: primaryColor,
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide:  BorderSide(color: primaryColor),
                            // ),
                            hintText: "description",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Appointment Time:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: primaryColor,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                selectedTime ==
                                        const TimeOfDay(hour: 00, minute: 00)
                                    ? '(Select your date & time)'
                                    : "${selectedDate.toString().substring(0, 10)} ${timeController.text}",
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Appointment Mode:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      DropdownButtonFormField<String>(
                        value: controller.mode.value,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        validator: (value) =>
                            value == modes.first ? '---- Choose ----' : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            controller.mode.value = newValue!;
                          });
                        },
                        items:
                            modes.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Consultation Fee:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Obx(
                            () => Text(
                              controller.mode.value == "Online"
                                  ? widget.data.commission!.online!.fees!
                                      .toString()
                                  : controller.mode.value == "Offline"
                                      ? widget.data.commission!.offline!.fees!
                                          .toString()
                                      : "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        height: 40,
                        minWidth: Get.width,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (controller.appointmentTime != "") {
                              if (controller.mode.value == "Online") {
                                Get.to(PaymentModeScreen(
                                    fee: widget.data.commission!.online!.fees!,
                                    docId: widget.data.id!));
                              } else {
                                Get.to(PaymentModeScreen(
                                    fee: widget.data.commission!.offline!.fees!,
                                    docId: widget.data.id!));
                              }
                            }else{
                              Fluttertoast.showToast(msg: "Please Select Appointment Time");
                            }
                          }
                        },
                        color: primaryColor,
                        child: const Text(
                          'PAY NOW',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:panaux_customer/screens/orders/apis/bookings_api.dart';
import '../apis/orders_api.dart';
import '../models/booking_details_model.dart';
import '../models/order_details_model.dart';
import '../models/razorpay_order_model.dart';

class OrdersManagementController extends GetxController{
  RxBool gettingOrders=false.obs;
  RxBool loading=false.obs;
  RxList<OrderDetailsModel> orders=<OrderDetailsModel>[].obs;
  RxBool gettingBookings=false.obs;
  RxList<BookingModel> bookings=<BookingModel>[].obs;
  getOrdersList()async{
    gettingOrders.value=true;
    orders.value=await getOrdersApi();
    orders.sort((a,b){
      return b.createdAt!.compareTo(a.createdAt!);
    });
    gettingOrders.value=false;
  }
  cancelOrder(String id){
    loading.value=true;
    cancelOrderApi(id);
    loading.value=false;
  }
  RazorpayOrderModel? razorpayOrderModel;
  razorpayPaidOrder(String id)async{
    loading.value=true;
    razorpayOrderModel=await razorpayOrderApi(id);
    loading.value=false;
  }
  verifyRazorpayPaidOrder(String paymentId,String orderId,String signature )async{
    loading.value=true;
    await verifyRazorpayOrderApi(orderId,paymentId,signature);
    loading.value=false;
  }
  getBookingsList()async{
    gettingBookings.value=true;
    bookings.value=await getBookingsApi();
    bookings.sort((a,b){
      return b.createdAt!.compareTo(a.createdAt!);
    });
    gettingBookings.value=false;
  }
}
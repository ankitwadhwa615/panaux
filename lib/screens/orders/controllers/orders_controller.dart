import 'package:get/get.dart';
import 'package:panaux_customer/screens/orders/apis/bookings_api.dart';
import '../apis/orders_api.dart';
import '../models/booking_details_model.dart';
import '../models/order_details_model.dart';

class OrdersManagementController extends GetxController{
  RxBool gettingOrders=false.obs;
  RxBool loading=false.obs;
  RxList<OrderDetailsModel> orders=<OrderDetailsModel>[].obs;
  RxBool gettingBookings=false.obs;
  RxList<BookingModel> bookings=<BookingModel>[].obs;
  getOrdersList()async{
    gettingOrders.value=true;
    orders.value=await getOrdersApi();
    gettingOrders.value=false;
  }
  cancelOrder(String id){
    loading.value=true;
    cancelOrderApi(id);
    loading.value=false;
  }
  paidOrder(String id,String mode){
    loading.value=true;
    paidOrderApi(id,mode);
    loading.value=false;
  }
  getBookingsList()async{
    gettingBookings.value=true;
    bookings.value=await getBookingsApi();
    gettingBookings.value=false;
  }
}
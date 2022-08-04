import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/orders/apis/bookings_api.dart';
import '../apis/orders_api.dart';
import '../apis/ratings_api.dart';
import '../models/booking_details_model.dart';
import '../models/order_details_model.dart';
import '../../../commons/models/razorpay_order_model.dart';

class OrdersManagementController extends GetxController{
  RxInt rating=0.obs;
  RxBool ratings=false.obs;
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
    print('verifying....');
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
  walletPaidOrder(String id)async{
    loading.value=true;
    await walletOrderApi(id);
    loading.value=false;
  }
  addRating(String vendor,String order, String client)async{
    loading.value=true;
    await ratingsApi(client,order,vendor,rating.value);
    getOrdersList();
    loading.value=false;
  }
}
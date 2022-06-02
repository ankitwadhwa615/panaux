import 'package:get/get.dart';
import '../apis/orders_api.dart';
import '../models/order_details_model.dart';

class OrdersManagementController extends GetxController{
  RxBool gettingOrders=false.obs;
  RxBool loading=false.obs;
  RxList<OrderDetailsModel> orders=<OrderDetailsModel>[].obs;
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
}
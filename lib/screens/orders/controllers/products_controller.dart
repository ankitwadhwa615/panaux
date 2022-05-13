import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/screens/orders/apis/add_product_api.dart';
import 'package:panaux_customer/screens/orders/apis/search_product_api.dart';
import 'package:panaux_customer/screens/orders/models/product_model.dart';

class ProductsController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController searched=TextEditingController();
  TextEditingController quantity=TextEditingController();
  RxList<ProductModel> searchedProducts = <ProductModel>[].obs;
  ProductModel? selectedProduct;
  RxDouble totalAmount=0.0.obs;
  RxList addedProducts = [
  ].obs;
  final formKey = GlobalKey<FormState>();
  searchProducts(String keyword) async {
    loading.value = true;
    searchedProducts.value = await searchProductApi(keyword);
    update();
    loading.value = false;
  }
  saveProducts(String id) async {
    List products=[];
    for(int i=0;i<addedProducts.length;i++){
      products.add({
        "product":addedProducts[i]['id'],
        "quantity":addedProducts[i]['qty']
      });
    }
    await addProductApi(id, products,addedProducts.length,totalAmount.toInt());
    update();
  }
  calculateTotalAmount(){
    totalAmount.value=0.0;
    for(int i=0;i<addedProducts.length;i++){
      totalAmount.value += double.parse(((addedProducts[i]["price"] * addedProducts[i]['qty'])  + addedProducts[i]['taxAmount']).toString());
    }
  }

}

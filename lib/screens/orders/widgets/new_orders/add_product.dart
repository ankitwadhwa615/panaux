import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/products_controller.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // final ScrollController _controller = ScrollController();
  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add a Product',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                // Padding(
                // 	padding:
                // 	const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                // 	child: SizedBox(
                // 		width: Get.width,
                // 		height: 50,
                // 		child: DropdownSearch<String>(
                // 			mode: Mode.DIALOG,
                // 			items: const ["Paracetamol", 'crocin650', 'combiflame'],
                // 			showSearchBox: true,
                // 			searchFieldProps: TextFieldProps(
                // 				decoration: InputDecoration(
                // 					isDense: true,
                // 					contentPadding: const EdgeInsets.only(left: 10, top: 25),
                // 					focusedBorder: OutlineInputBorder(
                // 						borderSide: BorderSide(color: primaryColor),
                // 						borderRadius: const BorderRadius.all(
                // 							Radius.circular(8),
                // 						),
                // 					),
                // 					border: const OutlineInputBorder(
                // 						borderRadius: BorderRadius.all(Radius.circular(8))),
                // 				),
                // 			),
                // 			dropdownSearchDecoration: InputDecoration(
                // 				label: Text(
                // 					'Product Name',
                // 					style: TextStyle(color: primaryColor),
                // 				),
                // 				isDense: true,
                // 				contentPadding: const EdgeInsets.only(left: 10, top: 25),
                // 				focusedBorder: OutlineInputBorder(
                // 					borderSide: BorderSide(color: primaryColor),
                // 					borderRadius: const BorderRadius.all(
                // 						Radius.circular(8),
                // 					),
                // 				),
                // 				border: const OutlineInputBorder(
                // 					borderRadius: BorderRadius.all(Radius.circular(8))),
                // 			),
                // 			popupItemDisabled: (String s) => s.startsWith('I'),
                // 			onChanged: print,
                // 		),
                // 	),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: GetBuilder(
                      init: ProductsController(),
                      builder: (hi) {
                        return Column(children: [
                          SizedBox(
                            width: Get.width,
                            height: 60,
                            child: TextFormField(
                              cursorHeight: 25,
                              maxLines: 100,
                              controller: controller.searched,
                              keyboardType: TextInputType.text,
                              // onChanged: (content) {
                              // 	if(content.isNotEmpty){
                              //   controller.searchProducts(content);}
                              // },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please add product";
                                }
                              },
                              decoration: InputDecoration(
                                  label: Text(
                                    'Product',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  isDense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, top: 25),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (controller
                                            .searched.text.isNotEmpty) {
                                          controller.searchProducts(
                                              controller.searched.text);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.search_sharp,
                                        color: primaryColor,
                                        size: 29,
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                            ),
                          ),
                          Material(
                            elevation: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2)),
                              width: Get.width,
                              height: controller.searchedProducts.isEmpty
                                  ? 0
                                  : controller.searchedProducts.length == 1
                                      ? 50
                                      : 130,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.searchedProducts.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 12),
                                          child: Text(controller
                                              .searchedProducts[index].title),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.searched =
                                            TextEditingController(
                                                text: controller
                                                    .searchedProducts[index]
                                                    .title);
                                        controller.selectedProduct =
                                            controller.searchedProducts[index];
                                        controller.searchedProducts.clear();
                                        controller.update();
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ]);
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: SizedBox(
                    width: Get.width,
                    height: 60,
                    child: TextFormField(
                      controller: controller.quantity,
                      cursorHeight: 25,
                      maxLines: 100,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please add quantity";
                        }
                      },
                      decoration: InputDecoration(
                          label: Text(
                            'Quantity',
                            style: TextStyle(color: primaryColor),
                          ),
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 25),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.addedProducts.add(
                            {
                              'id': controller.selectedProduct?.id,
                              'productName': controller.selectedProduct?.title,
                              'imageUrl': controller.selectedProduct?.image[0],
                              'price': controller.selectedProduct?.price,
                              'qty': int.parse(controller.quantity.text),
                              "tax": controller.selectedProduct?.tax.name,
                              'taxAmount': controller.selectedProduct?.tax.tax,
                            },
                          );
                          controller.calculateTotalAmount();
                          controller.quantity.clear();
                          controller.searched.clear();
                          controller.update();
                        }
                      },
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.green),
                        child: const Center(
                            child: Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Added Products List',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                GetBuilder(
                  init: ProductsController(),
                  builder: (hi) {
                    return controller.addedProducts.isEmpty
                        ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 50,),
                            Icon(
                              CupertinoIcons.exclamationmark_circle,
                              color: primaryColor,
                              size: 50,
                            ),
                            const SizedBox(height: 5,),
                            const Text('No Products Added',style: TextStyle(color: Colors.black,fontSize: 12),),
                          ],
                        ))
                        :ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.addedProducts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: FadeInImage(
                                  fit: BoxFit.contain,
                                  placeholder: const AssetImage(
                                      'assets/images/logo.png'),
                                  image: NetworkImage(
                                    controller.addedProducts[index]["imageUrl"]
                                        .toString(),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        controller.addedProducts[index]
                                                ['productName']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        softWrap: false,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₹" +
                                              controller.addedProducts[index]
                                                      ["price"]
                                                  .toString(),
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "* " +
                                              controller.addedProducts[index]
                                                      ['qty']
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Tax % :  " +
                                        controller.addedProducts[index]['tax']
                                            .toString()),
                                    Text("Tax Amount :  " +
                                        controller.addedProducts[index]
                                                ['taxAmount']
                                            .toString()),
                                    Text(
                                      "Total Amount: ₹" +
                                          ((controller.addedProducts[index]
                                                          ["price"] *
                                                      controller.addedProducts[
                                                          index]['qty']) +
                                                  controller
                                                          .addedProducts[index]
                                                      ['taxAmount'])
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                child: IconButton(
                                    onPressed: () {
                                      controller.addedProducts.removeAt(index);
                                      controller.update();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),

                Obx(
                  () =>controller.totalAmount.value==0.0?const SizedBox(): Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '₹ ${controller.totalAmount}',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
//            Expanded(
//              child: Scrollbar(
//                controller: _controller,
//                radius: const Radius.circular(3),
//                thickness: 5,
//                showTrackOnHover: true,
//                isAlwaysShown: true,
//                child: SingleChildScrollView(
//                  controller: _controller,
//                  scrollDirection: Axis.horizontal,
//                  child: DataTable(
//                    columnSpacing: 20,
//                    dividerThickness: 5,
//                    headingRowColor: MaterialStateColor.resolveWith((states) {
//                      return primaryColor;
//                    }),
//                    columns: const [
//                      DataColumn(
//                        label: Text(
//                          'Product',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Qty',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Price',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Tax(%)',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Tax(Amount)',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Total Amount',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                      DataColumn(
//                        label: Text(
//                          'Action',
//                          style: TextStyle(color: Colors.white, fontSize: 13),
//                        ),
//                      ),
//                    ],
//                    rows: controller
//                        .products // Loops through dataColumnText, each iteration assigning the value to element
//                        .map(
//                          ((element) => DataRow(
//                                cells: <DataCell>[
//                                  DataCell(SizedBox(
//                                    child: Image.network(
//                                        element["imageUrl"].toString()),
//                                    height: 30,
//                                    width: 40,
//                                  )),
//                                  //Extracting from Map element the value
//                                  DataCell(Text(element["qty"].toString())),
//                                  DataCell(Text(element["price"].toString())),
//                                  DataCell(Text(element["tax"].toString())),
//                                  DataCell(Text(element["taxAmount"].toString())),
//                                  DataCell(
//                                      Text(element["totalAmount"].toString())),
//                                  DataCell(
//                                    GestureDetector(
//                                      onTap: () {},
//                                      child: Container(
//                                        height: 30,
//                                        width: 50,
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                                BorderRadius.circular(3),
//                                            color: Colors.red),
//                                        child: const Center(
//                                          child: Text(
//                                            'Delete',
//                                            style: TextStyle(color: Colors.white),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  )
//                                ],
//                              )),
//                        )
//                        .toList(),
//                  ),
//                ),
//              ),
//            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

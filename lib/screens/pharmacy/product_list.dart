import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/commons/constants.dart';

import 'models/pharmacy_model.dart';

class ProductList extends StatefulWidget {
  final PharmacyModel data;
  const ProductList({Key? key, required this.data}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _vegSwitchValue = false;
  bool _nonVegSwitchValue = false;
  @override
  Widget build(BuildContext context) {
    List<bool> data=[];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.storeName!,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 27,
                        ),
                      ),
                      Text(
                        "${widget.data.address!.city.toString()}, ${widget.data.address!.state.toString()}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.67),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        Container(
                          height: 32,
                          width: 52,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.data.averageRating.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 52,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "${widget.data.totalRatings.toString()} reviews",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      activeColor: Colors.green.withOpacity(0.4),
                      thumbColor: Colors.green,
                      trackColor: Colors.grey.withOpacity(0.4),
                      value: _vegSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          _vegSwitchValue = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Veg",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      activeColor: Colors.red.withOpacity(0.4),
                      thumbColor: Colors.red,
                      trackColor: Colors.grey.withOpacity(0.4),
                      value: _nonVegSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          _nonVegSwitchValue = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Non-Veg",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: Get.height * 0.73,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    data.add(false);
                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Crocin Tablets",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      softWrap: false,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.9),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "₹52",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Crocin Pain Relief provides targeted pain relief. It provides symptomatic relief from mild to moderate pain e.g from headache, migraine, toothache and musculoskeletal pain. Its formula contains clinically proven ingredients paracetamol and caffeine. It acts at the center of pain.",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    softWrap: false,
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.9),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Stack(children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: const Image(
                                    image: NetworkImage(
                                        "https://newassets.apollo247.com/pub/media/catalog/product/c/r/cro0007.jpg"),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 20,
                                left: 10,
                                bottom:7,
                                child: data[index]?
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        data[index]=true;
                                      });
                                    },child:Container(
                                  decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(7)),
                                  height: 30,
                                  width: 90,
                                  child: const Center(
                                    child: Text(
                                      "ADDED",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )):GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      data[index]=true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(7)),
                                    height: 30,
                                    width: 90,
                                    child: const Center(
                                      child: Text(
                                        "ADD +",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

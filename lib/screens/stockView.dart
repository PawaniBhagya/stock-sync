import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/NavBar.dart';
import 'package:stock_sync/components/StockCard.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/controllers/productController/ProductController.dart';
import 'package:stock_sync/screens/AddProducts.dart';

class StockView extends StatefulWidget {
  const StockView({super.key});

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            NavBar(image: 'ref.png', user: "View Stock"),

            // add ref's Widgets here
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  color: primaryColor,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product",
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text("Amount",
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Unit price",
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Obx(() {
                            if (_productController.isLoading.value) {
                              return CircularProgressIndicator();
                            } else {
                              return Column(
                                children: _productController.products.map((product) {
                                  return StockCard(
                                    productName: product.name,
                                    amount: product.stock,
                                    price: product.unitPrice,
                                  );
                                }).toList(),
                              );
                            }
                          }),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  Get.to(() => Addproducts());
                },
                child: Text("Add New item to stock"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: secondaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
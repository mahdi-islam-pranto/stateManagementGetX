import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:state_management_getx/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),

                            // RaisedButton(
                            //   onPressed: () {
                            //     cartController
                            //         .addToCart(controller.products[index]);
                            //   },
                            //   color: Colors.blue,
                            //   textColor: Colors.white,
                            //   child: Text('Add to Cart'),
                            // ),
                            // Obx(() => IconButton(
                            //       icon: controller
                            //               .products[index].isFavorite.value
                            //           ? Icon(Icons.check_box_rounded)
                            //           : Icon(Icons
                            //               .check_box_outline_blank_outlined),
                            //       onPressed: () {
                            //         controller.products[index].isFavorite
                            //             .toggle();
                            //       },
                            //     ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Total Ammount'),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

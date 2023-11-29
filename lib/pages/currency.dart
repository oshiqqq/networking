import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking/controllers/currency_controller.dart';

class CurrencyPage extends StatelessWidget {
  final CurrencyController controller = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'Currency Info',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xFF494F55),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Валюта: ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/USD.png',
                    width: 32.0,
                    height: 32.0,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    'USD',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.currenciesList.isEmpty) {
                  return Center(child: Text('No data available.'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.currenciesList.length,
                    itemBuilder: (context, index) {
                      var currency = controller.currenciesList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: currency.data.entries
                            .where((entry) =>
                            ['RUB', 'EUR', 'KZT', 'GBP', 'CNY']
                                .contains(entry.key))
                            .map(
                              (entry) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/${entry.key.toLowerCase()}.png',
                                      width: 32.0,
                                      height: 32.0,
                                    ),
                                    SizedBox(width: 12.0),
                                    Text(
                                      "${entry.key}",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${entry.value.value.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            .toList(),
                      );
                    },
                  );
                }
              }),
              SizedBox(height: 20.0),
              Obx(() => Text(
                'Last Updated: ${controller.currenciesList.isNotEmpty ? controller.currenciesList.last.meta.lastUpdatedAt.toString() : "-"}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

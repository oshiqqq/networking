import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking/controllers/coin_controller.dart';
class CryptoPage extends StatelessWidget {

  final CoinController controller = Get.put(CoinController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.black26,
         title: Text('Crypto Info',
             style: TextStyle(
                 fontSize: 25,
                 color: Colors.white,
                 fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Color(0xFF494F55),
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 7),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                ()=> controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(controller.coinsList[index].image)
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                                    Text(controller.coinsList[index].name, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                    Text('${controller.coinsList[index].priceChangePercentage24H} %', style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 10,),
                                Text('${controller.coinsList[index].currentPrice}\$', style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                                Text(controller.coinsList[index].symbol, style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:networking/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Currency> currenciesList = <Currency>[].obs;

  final apiKey = 'cur_live_B0uy0aKwC5CzJfI372RxJzOTjunPCDgKkpWyGhPj';

  @override
  void onInit() {
    super.onInit();
    fetchCurrencies();
  }

  fetchCurrencies() async {
    try {
      isLoading(true);
      var response =
      await http.get(Uri.parse('https://api.currencyapi.com/v3/latest?apikey=$apiKey'));
      Currency currencies = currencyFromJson(response.body);
      currenciesList.add(currencies); // Add the currency to the list
    } finally {
      isLoading(false);
    }
  }
}

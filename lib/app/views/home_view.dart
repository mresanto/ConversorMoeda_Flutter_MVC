import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController toText = TextEditingController();

  late final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: ListView(
            children: [
              Image.network(
                'https://cdn.icon-icons.com/icons2/618/PNG/512/Currency_Conversion_icon-icons.com_56682.png',
                width: 200,
                height: 200,
              ),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (CurrencyModel? model) {
                  setState(() {
                    homeController.toCurrency = model!;
                  });
                },
              ),
              const SizedBox(height: 10),
              CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  }),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                child: const Text('CONVERTER'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

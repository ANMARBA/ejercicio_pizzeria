import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '/widgets/custom_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double total = 0;
  final List<Pizza> pizzas = [
    Pizza(
      assetPicture: 'assets/images/pizza_1.png',
      description: 'Pizza Con Carne',
      price: 12.000,
      amount: 0,
      totalPrice: 0,
    ),
    Pizza(
      assetPicture: 'assets/images/pizza_2.png',
      description: 'Pizza Vegetariana',
      price: 15.000,
      amount: 0,
      totalPrice: 0,
    ),
    Pizza(
      assetPicture: 'assets/images/pizza_3.png',
      description: 'Pizza Mexicana',
      price: 10.000,
      amount: 0,
      totalPrice: 0,
    ),
    Pizza(
      assetPicture: 'assets/images/pizza_4.png',
      description: 'Pizza Revolcon',
      price: 8.000,
      amount: 0,
      totalPrice: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text('PIZZA'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: pizzas.length,
              itemBuilder: (_, i) {
                Pizza pizza = pizzas[i];
                return Card(
                  child: ListTile(
                    title: Text(pizza.description),
                    subtitle: Text('\$ ${pizza.price.toStringAsFixed(3)}'),
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(pizza.assetPicture),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    trailing: CustomCounter(
                      callback: (amount) {
                        setState(() {
                          pizza.amount = amount;
                          pizza.totalPrice = (pizza.price * pizza.amount);
                          total = 0;
                          for (var item in pizzas) {
                            total += item.totalPrice;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF2980b9),
          onPressed: null,
          elevation: 0,
          label: Text(
            'Total: ${currency()}',
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  String currency() {
    var oCcy = NumberFormat.simpleCurrency(decimalDigits: 3);
    return oCcy.format(total);
  }
}

class Pizza {
  String assetPicture, description;
  double price;
  int amount;
  double totalPrice;

  Pizza({
    required this.assetPicture,
    required this.description,
    required this.price,
    required this.amount,
    required this.totalPrice,
  });
}

import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  String buttonText;
  double balance;
  bool isLoading;

  BalanceProvider({
    this.buttonText = 'ব্যালেন্স দেখুন',
    this.balance = 0.0,
    this.isLoading = false,
  });

  Future<String> fetchBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    return balance.toString();
  }
}

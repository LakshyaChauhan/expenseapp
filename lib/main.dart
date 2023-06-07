import 'package:expenseapp/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Expense App',
    home: Expenses(),
  ));
}

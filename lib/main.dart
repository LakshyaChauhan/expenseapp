import 'package:expenseapp/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    theme: ThemeData(useMaterial3: true),
    title: 'Expense App',
    home: const Expenses(),
  ));
}

import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        category: Category.work,
        amount: 399,
        date: DateTime.now()),
    Expense(
        title: 'Cinema',
        category: Category.leisure,
        amount: 500,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Chrat'),
            Text('Expenses List'),
          ],
        ),
      ),
    );
  }
}

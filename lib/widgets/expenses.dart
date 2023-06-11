import 'package:expenseapp/widgets/chart/chart.dart';
import 'package:expenseapp/widgets/expenses-list/expenses_list.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        showDragHandle: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: onAddExpense,
            ));
  }

  void onAddExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void onRemoveExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted..'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
                _registeredExpenses.insert(index, expense);
              })),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget container =
        const Center(child: Text('No Expense added, try adding some!'));

    if (_registeredExpenses.isNotEmpty) {
      container = ExpensesList(
          expenses: _registeredExpenses, onRemoved: onRemoveExpense);
    }
    double sum = 0;
    for (final total in _registeredExpenses) {
      sum += total.amount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Total expense  = $sum',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 80, 9, 119)),
          ),
          Chart(expenses: _registeredExpenses),
          Expanded(child: container),
        ]),
      ),
    );
  }
}

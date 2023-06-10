import 'package:expenseapp/widgets/expenses-list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenseapp/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoved});

  final List<Expense> expenses;
  final Function(Expense expense) onRemoved;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.8),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
              
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoved(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index])));
  }
}

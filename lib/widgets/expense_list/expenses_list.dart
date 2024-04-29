import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenses, this.onRemoveExpense, {super.key});

  final List<Expense> expenses;
  final Function onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.6),
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) => onRemoveExpense(expenses[index]),
            child: ExpenseItem(expenses[index])));
  }
}

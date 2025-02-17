import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                expense.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(expense.formattedDate)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

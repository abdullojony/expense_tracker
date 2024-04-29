import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late List<Expense> _registeredExpenses;

  @override
  void initState() {
    _registeredExpenses = [];
    super.initState();
  }

  void _addExpense(context) async {
    dynamic data = await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const NewExpense());

    if (data != null) {
      setState(() {
        _registeredExpenses.add(Expense(
            amount: data['amount'],
            title: data['title'],
            date: data['date'],
            category: data['category']));
      });
    }
  }

  void _removeExpense(Expense expense) {
    var expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses yet! Try to add some.'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(_registeredExpenses, _removeExpense);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('My expenses'),
          actions: [
            IconButton(
                onPressed: () {
                  _addExpense(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: width < 600
            ? Column(children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent)
              ])
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent)
                ],
              ));
  }
}

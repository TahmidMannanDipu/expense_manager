import 'package:expense_manager/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert'; // Add this for JSON encoding

class ExpenseProvider with ChangeNotifier {

  //* initialize local Storage
  final LocalStorage storage;

  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  ExpenseProvider(this.storage) {
    _loadExpenseFromStorage();
  }

//* load data from storage
  void _loadExpenseFromStorage() async {
    var storedData = storage.getItem('expenses');
    if (storedData != null) {
      List<dynamic> parsed = jsonDecode(storedData); // Decode stored string
      _expenses = parsed.map((item) => Expense.fromJson(item)).toList();
    }
    notifyListeners();
  }

//* Save data on storage
  void _saveExpenseToStorage() {
    String data = jsonEncode(_expenses.map((e) => e.toJson()).toList());
    storage.setItem('expenses', data);
  }

//* add expense
  void addExpense(Expense expense) {
    try {
      _expenses.add(expense);
      _saveExpenseToStorage();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

//* add or update expense
  void addOrUpdateExpense(Expense expense) {
    try {
      int index = _expenses.indexWhere((e) => e.id == expense.id);
      if (index != -1) {
        _expenses[index] = expense;
      } else {
        _expenses.add(expense);
      }
      _saveExpenseToStorage();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

//* delete expense
  void removeExpense(int id) {
    try {
      _expenses.removeWhere((expenses) => expenses.id == id);
      _saveExpenseToStorage();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}

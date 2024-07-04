import 'package:flutter/material.dart';
import '../Services/transacation_service.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
  bool _isLoading = false;

  List<Transaction> get transactions => _transactions;
  bool get isLoading => _isLoading;

  Future<void> fetchTransactions(String selectedDate) async {
    if (_transactions.isNotEmpty) return;

    _isLoading = true;
    notifyListeners();

try {
      List<Transaction>? transactions =
          await TransactionService().getTransactionList();
      if (transactions != null) {
      } else {
        print('No transactions found.');
      }
    } catch (error) {
      // Handle error
      print('Error fetching transactions: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

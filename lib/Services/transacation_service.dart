import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import for DateFormat
import '../models/transaction.dart';

class TransactionService {
  final String refundUrl = 'http://34.128.114.59:8001/refund';
  final String transactionListUrl =
      'http://34.128.114.59:8001/getTransactionList';

  Future<List<Transaction>?> getTransactionList() async {
    print('Fetching transactions from: $transactionListUrl');

    final response = await http.post(
      Uri.parse(transactionListUrl),
      body: json.encode({
        "trxTime": '2024-07-01',
        "cpan": "08310837408713084732",
        "invoiceNumber": "12851351490000000000",
        "referenceNumber": "202406202101300000004997000000000001"
      }),
      headers: {"Content-Type": "application/json"},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['transactionList'] != null) {
        List<dynamic> transactionList = data['transactionList'];
        return transactionList
            .map((json) => Transaction.fromJson(json))
            .toList();
      } else {
        print('No transactions found.');
        return null; // Return null to indicate no transactions found
      }
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<Transaction> refundTransaction(String referenceNumber) async {
    final response = await http.post(
      Uri.parse(refundUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'referenceNumber': referenceNumber,
      }),
    );

    print('Refund response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final DateFormat dateFormat = DateFormat('dd MMM yyyy, HH:mm:ss');
      final DateTime parsedTime = dateFormat.parse(data['time']);

      print(
          'Refund successful for reference number $referenceNumber at $parsedTime');

      final refundTransaction = Transaction.fromJson(data);
      return refundTransaction.copyWith(time: parsedTime);
    } else {
      throw Exception('Failed to refund transaction');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:test_cpts/Style/TextStyle.dart';
import '../Services/transacation_service.dart';
import '../providers/transaction_provider.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  final TransactionService _transactionService = TransactionService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String selectedDate = '2024-07-01';
      Provider.of<TransactionProvider>(context, listen: false)
          .fetchTransactions(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction List'),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.transactions.isEmpty) {
            return const Center(
              child: Text('No transactions found'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, index) {
                final transaction = provider.transactions[index];
                return GestureDetector(
                  onTap: () {
                    print(transaction.invoiceNumber);
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                          ),
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 28,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Transaction Details',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Column(
                                    children: [
                                      _buildDetailRow(
                                        'Customer Name: ',
                                        transaction.customerName,
                                      ),
                                      _buildDetailRow(
                                        'Issuer Name: ',
                                        transaction.issuerName,
                                      ),
                                      _buildDetailRow(
                                        'CPAN: ',
                                        transaction.cpan,
                                      ),
                                      _buildDetailRow(
                                        'Merchant Pan: ',
                                        transaction.merchantPan,
                                      ),
                                      _buildDetailRow(
                                        'Time: ',
                                        DateFormat('yyyy-MM-dd')
                                            .format(transaction.time),
                                      ),
                                      _buildDetailRow(
                                        'Amount: ',
                                        transaction.amount.toStringAsFixed(2),
                                      ),
                                      _buildDetailRow(
                                        'Invoice Number: ',
                                        transaction.invoiceNumber,
                                      ),
                                      _buildDetailRow(
                                        'Reference Number: ',
                                        transaction.referenceNumber,
                                      ),
                                      _buildDetailRow(
                                        'Acquirer Name: ',
                                        transaction.acquirerName,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () async {
                                          try {
                                            print(
                                                'Refunding transaction: $transaction');
                                            final refundTransaction =
                                                await _transactionService
                                                    .refundTransaction(
                                              transaction.referenceNumber,
                                            );
                                            print(
                                                'Refund successful: $refundTransaction');
                                          } catch (e) {
                                            print('Refund failed: $e');
                                          }
                                        },
                                        child: const Text('Refund'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildHeaderText('Invoice Number :'),
                                _buildText(transaction.invoiceNumber),
                                _buildHeaderText('Reference Number :'),
                                _buildText(transaction.referenceNumber),
                                _buildHeaderText('Issuer Name :'),
                                _buildText(transaction.issuerName),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildText(DateFormat('yyyy-MM-dd – kk:mm')
                                    .format(transaction.time)),
                                _buildText(
                                    transaction.amount.toStringAsFixed(2)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CustomText.subhead,
        ),
        Text(
          value,
          style: CustomText.title,
        ),
      ],
    );
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      style: CustomText.headline,
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: CustomText.subhead,
    );
  }
}

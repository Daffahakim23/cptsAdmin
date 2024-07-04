import 'package:intl/intl.dart';

class Transaction {
  final DateTime time;
  final String acquirerName;
  final String customerName;
  final String cpan;
  final String merchantPan;
  final String issuerName;
  final int amount;
  final String invoiceNumber;
  final String referenceNumber;
  final bool isRefund; // Tambahkan properti isRefund

  Transaction({
    required this.time,
    required this.acquirerName,
    required this.customerName,
    required this.cpan,
    required this.merchantPan,
    required this.issuerName,
    required this.amount,
    required this.invoiceNumber,
    required this.referenceNumber,
    required this.isRefund, // Tambahkan parameter isRefund
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final DateTime parsedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['time']);

    return Transaction(
      time: parsedDate,
      acquirerName: json['acquirerName'],
      customerName: json['customerName'],
      cpan: json['cpan'],
      merchantPan: json['merchantPan'],
      issuerName: json['issuerName'],
      amount: json['amount'],
      invoiceNumber: json['invoiceNumber'],
      referenceNumber: json['referenceNumber'],
      isRefund: json['is_refund'] == 'true', // Ubah is_refund dari JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': DateFormat("yyyy-MM-dd HH:mm:ss").format(time),
      'acquirerName': acquirerName,
      'customerName': customerName,
      'cpan': cpan,
      'merchantPan': merchantPan,
      'issuerName': issuerName,
      'amount': amount,
      'invoiceNumber': invoiceNumber,
      'referenceNumber': referenceNumber,
      'is_refund': isRefund.toString(), // Tambahkan isRefund ke JSON
    };
  }

  Transaction copyWith({
    DateTime? time,
    String? acquirerName,
    String? customerName,
    String? cpan,
    String? merchantPan,
    String? issuerName,
    int? amount,
    String? invoiceNumber,
    String? referenceNumber,
    bool? isRefund, // Tambahkan parameter isRefund
  }) {
    return Transaction(
      time: time ?? this.time,
      acquirerName: acquirerName ?? this.acquirerName,
      customerName: customerName ?? this.customerName,
      cpan: cpan ?? this.cpan,
      merchantPan: merchantPan ?? this.merchantPan,
      issuerName: issuerName ?? this.issuerName,
      amount: amount ?? this.amount,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      isRefund: isRefund ?? this.isRefund, // Tambahkan isRefund ke copyWith
    );
  }
}

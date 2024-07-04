import 'package:flutter/material.dart';
import '../services/refund_service.dart';

class RefundProvider with ChangeNotifier {
  final RefundService _refundService = RefundService();
  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;

  Future<void> refund(String referenceNumber) async {
    _isLoading = true;
    _message = '';
    notifyListeners();

    try {
      final response = await _refundService.sendRefundRequest(referenceNumber);
      _message = 'Refund Successful: $response';
    } catch (e) {
      _message = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

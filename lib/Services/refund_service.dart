import 'dart:convert';
import 'package:http/http.dart' as http;

class RefundService {
  final String url = "https://api.mocki.io/v2/fx7ibpjn/refund_first";

  Future<Map<String, dynamic>> sendRefundRequest(String referenceNumber) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'referenceNumber': referenceNumber,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to refund: ${response.statusCode}');
    }
  }
}

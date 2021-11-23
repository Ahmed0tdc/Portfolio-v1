import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/src/utils/secrets.dart';

class EmailService {
  final String _sendUrl = 'https://api.emailjs.com/api/v1.0/email/send';
  // get your own Email API keys ;)

  Future<bool> sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    bool emailIsSent = false;
    final Uri _parsedUrl = Uri.parse(_sendUrl);
    final Map<String, String> _emialParams = {
      'user_name': name,
      'user_subject': '',
      'user_email': email,
      'user_message': message,
    };
    final _body = {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': _emialParams,
    };
    try {
      http.Response _response = await http.post(
        _parsedUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(_body),
      );
      if (_response.statusCode == 200) {
        emailIsSent = true;
      }
    } catch (e) {
      print(e);
    }
    return emailIsSent;
  }
}

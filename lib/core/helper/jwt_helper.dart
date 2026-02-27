import 'dart:convert';

import 'package:flutter/material.dart';


class JwtHelper {
  static int? getUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      String payload = parts[1];

      switch (payload.length % 4) {
        case 2: payload += '=='; break;
        case 3: payload += '='; break;
      }

      final decoded = utf8.decode(base64Url.decode(payload));
      final Map<String, dynamic> json = jsonDecode(decoded);

      const claimKey =
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';

      final id = json[claimKey];
      return id != null ? int.tryParse(id.toString()) : null;
    } catch (e) {
      debugPrint('JwtHelper error: $e');
      return null;
    }
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  int valueConsumed;

  get valueConsume {
    return valueConsumed;
  }

  
}

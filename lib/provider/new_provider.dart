import 'package:flutter/material.dart';
import 'package:emmthaan/service/new_service.dart';

class newprovider extends ChangeNotifier {

  List<Map> articles = [];
  String status = '';
  bool isLoading = false;
  String? error;

  Future<void> fetchArticles() async {
    _setLoading(true);

    try {
      final response = await prayarservece.getArticles();
      if (response.data == null) {
        articles = response.articles;
        status = response.status;

      } else {
        error = 'Failed to load articles';
      }
    } catch (e) {
      error = 'Error: $e';
    } finally {
      _setLoading(false);
    }

    notifyListeners();
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
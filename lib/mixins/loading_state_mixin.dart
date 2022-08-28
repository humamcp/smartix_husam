import 'package:flutter/material.dart';

mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  void showLoading() => _toggleLoading(true);
  void hideLoading() => _toggleLoading(false);
  void _toggleLoading(bool show) {
    if (mounted) {
      setState(() {
        isLoading = show;
      });
    }
  }
}

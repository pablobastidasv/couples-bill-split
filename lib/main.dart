import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/views/my_app_widget.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

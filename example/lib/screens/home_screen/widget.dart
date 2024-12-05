// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:df_screen/df_screen.dart';

import '../../main.dart';
import '../_index.g.dart';

part '_bindings.g.dart';
part '_controller.dart';
part '_state.dart';

@GenerateScreenBindings()
final class HomeScreen extends _HomeScreen {
  const HomeScreen({
    super.key,
    super.extra,
  });
}

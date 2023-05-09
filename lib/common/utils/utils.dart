import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

export 'data_state.dart';

void $debugLog(dynamic object, {String? tag}) {
  log(object.toString(), name: tag ?? 'debug.log');
}

/// Returns [T] if instance of [T], otherwise null
T? $cast<T>(dynamic value) => value == null
    ? null
    : value is T
        ? value
        : null;

/// [apply] mapping with [T] as parameter and [R] as return value
R? $mapTo<T, R>(T? object, R? Function(T it) apply) =>
    object != null ? apply(object) : null;

/// [apply] mapping with dynamic parameter and [R] as return value
R? $mapIt<R>(Object? object, R? Function(dynamic it) apply) =>
    object != null ? apply(object) : null;

List<T>? $mapList<T>(dynamic list, T Function(dynamic e) apply) =>
    (list as List?)?.map<T>(apply).toList();

List<R>? $mapToList<T, R>(List<T>? list, R Function(T it) apply) =>
    list?.map<R>(apply).toList();

/// Signature for function that return updated value [T] from the
/// [previous] value of same type passed.
typedef UpdateFromPrevious<T> = T Function(T previous);

typedef JsonObject = Map<String, dynamic>;
typedef JsonArray = List<dynamic>;

extension StringToJson on String {
  Map<String, dynamic>? toJsonObject() {
    final dynamic value = json.decode(this);
    return value is Map<String, dynamic> ? value : null;
  }

  List<dynamic>? toJsonArray() {
    final dynamic value = json.decode(this);
    return value is List<dynamic> ? value : null;
  }
}

extension JsonToString on Map<String, dynamic> {
  String toJsonString() => json.encode(this);
}

extension JsonArrayToString on List<dynamic> {
  String toJsonString() => json.encode(this);
}

extension IterableExtension<T> on Iterable<T> {
  /// The elements that do not satisfy [test].
  Iterable<T> whereNot(bool Function(T element) test) =>
      where((element) => !test(element));
}

extension FocusContext on BuildContext {
  /// Dismiss keyboard
  void unfocus() {
    FocusScope.of(this).requestFocus(FocusNode());
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

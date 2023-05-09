import 'package:equatable/equatable.dart';

enum DataStatus {
  initial,
  loading,
  loaded,
  failure,
  ;

  bool get isInitial => this == DataStatus.initial;

  bool get isNotInitial => !isInitial;

  bool get isLoading => this == DataStatus.loading;

  bool get isNotLoading => !isLoading;

  bool get isLoaded => this == DataStatus.loaded;

  bool get isNotLoaded => !isLoaded;

  bool get isFailure => this == DataStatus.failure;

  bool get isNotFailure => !isFailure;
}

class DataState<T> extends Equatable {
  const DataState({
    this.data,
    this.status = DataStatus.initial,
    this.error,
  });

  final T? data;
  final DataStatus status;
  final dynamic error;

  factory DataState.initial({T? data}) => DataState(data: data);

  factory DataState.loading({T? data}) => DataState(
        data: data,
        status: DataStatus.loading,
      );

  factory DataState.loaded({T? data}) => DataState(
        data: data,
        status: DataStatus.loaded,
      );

  factory DataState.failure({T? data, dynamic error}) => DataState(
        data: data,
        status: DataStatus.failure,
        error: error,
      );

  DataState<T> copyWith({
    T? data,
    DataStatus? status,
    dynamic error,
  }) {
    return DataState<T>(
      data: data ?? this.data,
      status: status ?? this.status,
      error: status?.isLoaded == true ? null : error ?? this.error,
    );
  }

  DataState<T> toLoading() => copyWith(status: DataStatus.loading);

  DataState<T> toLoaded({T? data}) => copyWith(
        data: data,
        status: DataStatus.loaded,
      );

  DataState<T> toFailure({dynamic error}) => copyWith(
        status: DataStatus.failure,
        error: error,
      );

  String? get errorMessage {
    final dynamic e = error;
    return isFailure
        ? e is String
            ? e
            : e?.toString() ?? 'Something went wrong'
        : null;
  }

  bool get isInitial => status.isInitial;

  bool get isNotInitial => status.isNotInitial;

  bool get isLoading => status.isLoading;

  bool get isNotLoading => status.isNotLoading;

  bool get isLoaded => status.isLoaded;

  bool get isNotLoaded => status.isNotLoaded;

  bool get isFailure => status.isFailure;

  bool get isNotFailure => status.isNotFailure;

  bool get isEmpty {
    final vData = data;
    return vData == null || vData is List && vData.isEmpty;
  }

  bool get isNotEmpty => !isEmpty;

  bool get hasError => error?.toString().isNotEmpty == true;

  bool get hasNoError => !hasError;

  bool get isError => isEmpty || isFailure || hasError;

  bool get isNotError => !isError;

  @override
  List<Object?> get props => [data, status, error];
}

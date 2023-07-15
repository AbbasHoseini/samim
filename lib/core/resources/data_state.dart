
// abstract class DataState<T>{
//   final T? data;
//   final String? error;

//   const DataState(this.data, this.error);
// }


abstract class DataState<T>{
  final T? data;
  final String? message;

  const DataState(this.data, this.message);
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T? data, message) : super(data, message);
}

class DataFailed<T> extends DataState<T>{
  const DataFailed(String error) : super(null, error);
}
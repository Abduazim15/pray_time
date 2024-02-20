part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<ByMonthResponse> data;

  DataLoaded(this.data);

  @override
  List<Object> get props => [data];
}
class DataError extends DataState {
  final String message;

  DataError(this.message);

  @override
  List<Object> get props => [message];
}
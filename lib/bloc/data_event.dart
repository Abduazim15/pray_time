part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDataEvent extends DataEvent {
  final int month;

  FetchDataEvent({required this.month});
}

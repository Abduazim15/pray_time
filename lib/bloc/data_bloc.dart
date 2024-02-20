import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:islam/dio/pray_service.dart';
import 'package:islam/models/ByMonthResponse.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final PrayDioService apiService;

  DataBloc(this.apiService) : super(DataInitial()){
    on<FetchDataEvent>(_fetchData);
  }

  void _fetchData(FetchDataEvent event, Emitter<DataState> emit) async {
    final response = await apiService.getByMonth(event.month);
    if(response != null) {
      emit(DataLoaded(response));
    }
    else {
      print('${response}');
    }
  }
}

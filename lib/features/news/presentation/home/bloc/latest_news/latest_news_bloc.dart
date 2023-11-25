import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/domain/entity/filter.dart';
import 'package:news_app/features/news/domain/usecase/latest_news_usecase.dart';

import 'latest_news_event.dart';
import 'latest_news_state.dart';

@Injectable()
class LatestNewsBloc extends Bloc<LatestNewsEvent, LatestNewsState> {
  final LatestNewsUseCase _latestNewsUseCase;

  LatestNewsBloc(this._latestNewsUseCase) : super(LatestNewsLoading()) {
    on<LoadLatestNews>((event, state) => _fetchData(event, state));
    on<FilterSelected>((event, state) => _selectFilter(event, state));
    on<LatestNewsToDetails>((event, state) {
      emit(LatestNewsToNavigateDetails(event.news));
    });
  }

  final latestNewsFilter = [
    Filter(filter: "technology", isSelected: true),
    Filter(filter: "health"),
    Filter(filter: "science"),
    Filter(filter: "crypto"),
    Filter(filter: "politics")
  ];
  var _defaultSelectedFilter = "technology";

  Future<void> _fetchData(
      LoadLatestNews event, Emitter<LatestNewsState> emit) async {
    try {
      emit(LatestNewsLoading());
      final data = await _latestNewsUseCase(_defaultSelectedFilter);
      emit(LatestNewsLoaded(data));
    } catch (e) {
      emit(LatestNewsError());
    }
  }

  Future<void> _selectFilter(
      FilterSelected event, Emitter<LatestNewsState> emit) async {
    for (int i = 0; i < latestNewsFilter.length; i++) {
      if (event.filter.filter == latestNewsFilter[i].filter) {
        latestNewsFilter[i].isSelected = true;
      } else {
        latestNewsFilter[i].isSelected = false;
      }
    }
    _defaultSelectedFilter = event.filter.filter;
    emit(FilterChanged(filter: event.filter));
    add(LoadLatestNews());
  }
}

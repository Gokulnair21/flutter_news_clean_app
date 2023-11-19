import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/domain/usecase/latest_news_usecase.dart';
import 'package:news_app/features/news/domain/usecase/top_head_line_usecase.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_event.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_state.dart';

@Injectable()
class TopHighLightBloc extends Bloc<TopHiglightEvent, TopHighLightState> {
  final TopHeadlineUseCase _topHeadLineUseCase;

  TopHighLightBloc(this._topHeadLineUseCase) : super(TopHigLightLoading()) {
    on<LoadData>((event, state) => _fetchData(event, state));
    on<NavigateToDetails>((event, state) {
      emit(NavigateToDetailsPage(event.news));
    });
  }

  Future<void> _fetchData(
      LoadData event, Emitter<TopHighLightState> emit) async {
    try {
      emit(TopHigLightLoading());
      final data = await _topHeadLineUseCase("in");
      emit(TopHigLightDataLoaded(data));
    } catch (e) {
      emit(TopHighLightDataError());
    }
  }
}

@Injectable()
class LatestNewsBloc extends Bloc<LatestNewsEvent, LatestNewsState> {
  final LatestNewsUseCase _latestNewsUseCase;

  LatestNewsBloc(this._latestNewsUseCase) : super(LatestNewsLoading()) {
    on<LoadLatestNews>((event, state) => _fetchData(event, state));
    on<LatestNewsToDetails>((event, state) {
      emit(LatestNewsToNavigateDetails(event.news));
    });
  }

  Future<void> _fetchData(
      LoadLatestNews event, Emitter<LatestNewsState> emit) async {
    try {
      emit(LatestNewsLoading());
      final data = await _latestNewsUseCase("technology");
      emit(LatestNewsLoaded(data));
    } catch (e) {
      emit(LatestNewsError());
    }
  }
}

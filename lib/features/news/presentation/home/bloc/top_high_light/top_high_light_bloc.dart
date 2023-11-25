import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/domain/usecase/top_head_line_usecase.dart';

import 'top_high_light_event.dart';
import 'top_high_light_state.dart';

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

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/domain/usecase/top_head_line_usecase.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_event.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_state.dart';

@Injectable()
class TopHighLightBloc extends Bloc<TopHiglightEvent, TopHighLightState> {
  final TopHeadlineUseCase topHeadLineUseCase;

  TopHighLightBloc(this.topHeadLineUseCase) : super(TopHigLightLoading()) {
    on<LoadData>((event, state) => _fetchData(event, state));
    on<NavigateToDetails>((event, state) {
      debugPrint("None");
    });
  }

  Future<void> _fetchData(
      LoadData event, Emitter<TopHighLightState> emit) async {
    try {
      final data = await topHeadLineUseCase("in");
      emit(TopHigLightDataLoaded(data));
      debugPrint("Data Updated");
    } catch (e) {
      debugPrint(e.toString());
      emit(TopHighLightDataError());
      debugPrint("State Rebuild");
    }
  }
}

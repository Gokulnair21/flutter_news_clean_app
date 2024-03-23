import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_bloc.freezed.dart';

@freezed
class TestBlocState with _$TestBlocState {
  const factory TestBlocState.initial({required int num}) = Initial;

  const factory TestBlocState.loading() = Loading;

  const factory TestBlocState.loaded(int num) = Loaded;
}

class TestBloc extends Cubit<TestBlocState> {
  TestBloc() : super(const TestBlocState.loading());
}

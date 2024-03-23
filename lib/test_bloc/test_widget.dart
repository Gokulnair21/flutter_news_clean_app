import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/test_bloc/test_bloc.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestBloc(),
      child: BlocBuilder<TestBloc, TestBlocState>(
        buildWhen: (previous, current) {
          return current is Loading;
        },
        builder: (BuildContext context, TestBlocState state) {
          return state.maybeWhen(
              loading: () => Text(""), orElse: () => Text(""));
        },
      ),);
  }
}

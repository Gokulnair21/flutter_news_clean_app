import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/domain/entity/filter.dart';
import 'package:news_app/features/news/presentation/home/bloc/latest_news/latest_news_bloc.dart';
import 'package:news_app/features/news/presentation/home/bloc/latest_news/latest_news_event.dart';
import 'package:news_app/util/extension/string_extensions.dart';


class FilterWidget extends StatelessWidget {
  final Filter filter;

  const FilterWidget({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LatestNewsBloc>();
    return GestureDetector(
      onTap: () {
        bloc.add(FilterSelected(filter: filter));
      },
      child: Container(
        height: double.minPositive,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
            color: filter.isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          filter.filter.capitalize(),
          style: TextStyle(
            color: filter.isSelected ? Colors.white : Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

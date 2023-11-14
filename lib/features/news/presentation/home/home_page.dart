import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_event.dart';
import 'package:news_app/features/news/presentation/home/bloc/home_state.dart';

import 'bloc/home_bloc.dart';
import 'news_item_highlight_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TopHighLightBloc>().add(LoadData());
    // getIt.get<TopHighLightBloc>().add(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(AppLocalizations.of(context)!.home),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           debugPrint("YOu clicked me");
      //         },
      //         icon: const Icon(Icons.settings))
      //   ],
      // ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: _headline(AppLocalizations.of(context)!.top_headline),
              ),
            ),
            BlocConsumer<TopHighLightBloc, TopHighLightState>(
                listenWhen: (oldState, newState) {
                  return newState is TopHighlightAction;
                },
                listener: (context, state) {},
                buildWhen: (oldState, newState) {
                  return newState is! TopHighlightAction;
                },
                builder: (context, state) {
                  if (state is TopHigLightDataLoaded) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: state.news.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsHiglightCard(news: state.news[index]);
                          },
                        ),
                      ),
                    );
                  }
                  return SliverToBoxAdapter();
                }),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: _headline(AppLocalizations.of(context)!.latest_news),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  //return  NewsListItemCard();
                },
                childCount: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _headline(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/common_widgets/carousel.dart';
import 'package:news_app/common_widgets/shimmer.dart';
import 'package:news_app/features/news/presentation/home/widgets/filter_widget.dart';
import 'package:news_app/features/news/presentation/home/widgets/higlight_loading.dart';
import 'package:news_app/features/news/presentation/home/widgets/news_list_item_card.dart';
import 'package:news_app/features/news/presentation/home/widgets/news_list_item_loading.dart';
import 'package:news_app/route/app_routes.dart';
import 'package:news_app/util/extension/ui_extension.dart';
import 'bloc/latest_news/latest_news_bloc.dart';
import 'bloc/latest_news/latest_news_event.dart';
import 'bloc/latest_news/latest_news_state.dart';
import 'bloc/top_high_light/top_high_light_bloc.dart';
import 'bloc/top_high_light/top_high_light_event.dart';
import 'bloc/top_high_light/top_high_light_state.dart';
import 'widgets/news_item_highlight_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _onRefresh() async {
    context.read<TopHighLightBloc>().add(LoadData());
    context.read<LatestNewsBloc>().add(LoadLatestNews());
  }

  @override
  void initState() {
    super.initState();
    context.read<TopHighLightBloc>().add(LoadData());
    context.read<LatestNewsBloc>().add(LoadLatestNews());
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
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
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
              }, listener: (context, state) {
                if (state is NavigateToDetailsPage) {
                  context.goNamed(AppRoutes.DETAILS_PAGE, extra: state.news);
                }
                //Navigation Part
              }, buildWhen: (oldState, newState) {
                return newState is! TopHighlightAction;
              }, builder: (context, state) {
                if (state is TopHigLightDataLoaded) {
                  return SliverToBoxAdapter(
                    child: Carousel(
                      height: 200,
                      itemCount: state.news.length,
                      showIndicator: false,
                      selectedIndicatorColor: Colors.blue,
                      unSelectedIndicatorColor: Colors.black12,
                      itemBuilder: (context, index) {
                        return NewsHiglightCard(
                          news: state.news[index],
                          callbackAction: () {
                            context
                                .read<TopHighLightBloc>()
                                .add(NavigateToDetails(state.news[index]));
                          },
                        );
                      },
                      autoMoveDuration: const Duration(seconds: 4),
                    ),
                  );
                } else if (state is TopHigLightLoading) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: Shimmer(
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              const HighLightLoading(),
                        ),
                      ),
                    ),
                  );
                }
                return _noDataFoundSliver();
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: _headline(AppLocalizations.of(context)!.latest_news),
                ),
              ),
              BlocBuilder<LatestNewsBloc, LatestNewsState>(
                buildWhen: (oldState, newState) {
                  return newState is FilterChanged;
                },
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 40,
                      child: ListView.builder(
                        itemCount: context
                            .read<LatestNewsBloc>()
                            .latestNewsFilter
                            .length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final data = context
                              .read<LatestNewsBloc>()
                              .latestNewsFilter[index];
                          return FilterWidget(filter: data);
                        },
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: const SizedBox().verticalGap(10),
              ),
              BlocConsumer<LatestNewsBloc, LatestNewsState>(
                listener: (context, state) {
                  if (state is LatestNewsToNavigateDetails) {
                    context.goNamed(AppRoutes.DETAILS_PAGE, extra: state.news);
                  }
                },
                listenWhen: (oldState, newState) {
                  return newState is LatestNewsAction;
                },
                buildWhen: (oldState, currentState) {
                  return currentState is! LatestNewsAction;
                },
                builder: (context, state) {
                  if (state is LatestNewsLoading) {
                    return SliverToBoxAdapter(
                      child: Shimmer(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const NewsListItemLoading();
                          },
                          itemCount: 10,
                        ),
                      ),
                    );
                  } else if (state is LatestNewsLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return NewsListItemCard(
                            news: state.news[index],
                            showDivider: !(index == state.news.length - 1),
                            callback: () {
                              context
                                  .read<LatestNewsBloc>()
                                  .add(LatestNewsToDetails(state.news[index]));
                            },
                          );
                        },
                        childCount: state.news.length,
                      ),
                    );
                  }
                  return _noDataFoundSliver();
                },
              )
            ],
          ),
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

  Widget _noDataFoundSliver() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "No Data Found",
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

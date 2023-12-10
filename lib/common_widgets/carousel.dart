import 'dart:async';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.autoMoveDuration,
      required this.selectedIndicatorColor,
      required this.unSelectedIndicatorColor,
      required this.showIndicator,
      required this.height});

  final NullableIndexedWidgetBuilder itemBuilder;
  final Duration autoMoveDuration;
  final Color selectedIndicatorColor;
  final Color unSelectedIndicatorColor;
  final bool showIndicator;
  final double height;
  final int itemCount;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  late Timer _timer;
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _automateTheTimer();
  }

  _automateTheTimer() {
    _timer = Timer.periodic(widget.autoMoveDuration, (timer) {
      if (_currentPage < widget.itemCount - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: widget.height,
        child: PageView.builder(
            itemCount: widget.itemCount,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            controller: _pageController,
            itemBuilder: widget.itemBuilder),
      ),
      Visibility(
        visible: widget.showIndicator,
        child: Center(
          child: SizedBox(
            height: 10,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemCount,
              itemBuilder: (_, index) => _pageIndicator(_currentPage == index),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _pageIndicator(bool isHighlighted) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isHighlighted
              ? widget.selectedIndicatorColor
              : widget.unSelectedIndicatorColor),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }
}

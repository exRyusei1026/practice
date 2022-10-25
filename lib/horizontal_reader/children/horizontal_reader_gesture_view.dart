import 'package:comic_viwer_practice/horizontal_reader/horizontal_reader_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HorizontalReaderGestureView extends ConsumerWidget {
  const HorizontalReaderGestureView({
    Key? key,
    required this.currentIndex,
    required this.controller,
    required this.comicLength,
  }) : super(key: key);

  final int currentIndex;
  final PageController controller;
  final int comicLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            excludeFromSemantics: true,
            onTap: currentIndex == comicLength - 1
                ? null
                : () => controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () =>
                ref.read(horizontalReaderProvider.notifier).changeFullScreen(),
            onPanUpdate: (details) {
              if (details.delta.dy > 25.0) {
                Navigator.of(context).pop();
              }
            },
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: currentIndex == 0
                ? null
                : () => controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
            ),
          ),
        ),
      ],
    );
  }
}

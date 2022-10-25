import 'package:comic_viwer_practice/extension/custom_page_view_scroll_physics.dart';
import 'package:comic_viwer_practice/extension/my_rounded_rect_slider_track_shape.dart';
import 'package:comic_viwer_practice/horizontal_reader/children/horizontal_reader_app_bar.dart';
import 'package:comic_viwer_practice/horizontal_reader/children/horizontal_reader_gesture_view.dart';
import 'package:comic_viwer_practice/horizontal_reader/horizontal_reader_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const list = [
  'https://www.sample-videos.com/img/Sample-jpg-image-50kb.jpg',
  'https://www.sample-videos.com/img/Sample-jpg-image-100kb.jpg',
  'https://www.sample-videos.com/img/Sample-jpg-image-200kb.jpg',
];

class HorizontalReaderScreen extends HookConsumerWidget {
  const HorizontalReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 200));
    final state = ref.watch(horizontalReaderProvider);
    final notifier = ref.read(horizontalReaderProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HorizontalReaderAppBar(
        controller: animationController,
        visible: !state.isFullScreen,
        child: AppBar(
          title: const Text('comic viewer'),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            reverse: true,
            allowImplicitScrolling: true,
            physics: const CustomPageViewScrollPhysics(),
            onPageChanged: notifier.changeIndex,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Center(
                child: Image.network(
                  list[index],
                ),
              );
            },
          ),
          HorizontalReaderGestureView(
            currentIndex: state.currentIndex,
            controller: pageController,
            comicLength: list.length,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: state.isFullScreen ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    // 6. ページ番号の表示がある
                    child: Text(
                      "${state.currentIndex + 1}/${list.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 60,
                    color: Colors.grey[200],
                    // 4. スライダーでページを移動できる
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.grey,
                        inactiveTrackColor: Colors.blueGrey,
                        thumbColor: Colors.white,
                        trackHeight: 3.0,
                        trackShape: MyRoundedRectSliderTrackShape(),
                      ),
                      child: Slider(
                        onChanged: (value) {
                          final currentIndex = list.length - 1 - value.floor();
                          notifier.changeIndex(currentIndex);
                          pageController.jumpToPage(currentIndex);
                        },
                        value:
                            (list.length - 1 - state.currentIndex).toDouble(),
                        min: 0,
                        max: list.length.toDouble() - 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:comic_viwer_practice/components/reader_app_bar.dart';
import 'package:comic_viwer_practice/vertical_reader/vertical_reader_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerticalReaderScreen extends HookConsumerWidget {
  const VerticalReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 200));
    final scrollController = useScrollController();
    final state = ref.watch(verticalReaderProvider(scrollController));
    final notifier =
        ref.read(verticalReaderProvider(scrollController).notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ReaderAppBar(
        controller: animationController,
        visible: !state.isFullScreen,
        child: AppBar(
          title: const Text('comic viewer'),
        ),
      ),
      body: ref.watch(comicProvider).when(
            data: (comic) => Stack(
              children: [
                ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  itemCount: comic.comicLength + 1,
                  itemBuilder: (context, index) {
                    if (index == comic.comicLength) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.vertical,
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: comic.branchUrls.map((e) {
                              return TextButton(
                                onPressed: () {},
                                child: Text(e),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }
                    return Image.network(
                      comic.imageUrls[index],
                      alignment: Alignment.topCenter,
                    );
                  },
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: notifier.changeFullScreen,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                  ),
                )
              ],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) => const SizedBox(),
          ),
    );
  }
}

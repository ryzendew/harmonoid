import 'package:adaptive_layouts/adaptive_layouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harmonoid/core/media_library.dart';
import 'package:harmonoid/extensions/genre.dart';
import 'package:harmonoid/ui/media_library/genres/genre_item.dart';
import 'package:harmonoid/utils/constants.dart';
import 'package:harmonoid/utils/rendering.dart';
import 'package:harmonoid/utils/scroll_view_builder_helper.dart';
import 'package:harmonoid/utils/widgets.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => GenresScreenState();
}

class GenresScreenState extends State<GenresScreen> {
  double get headerHeight {
    if (isDesktop) {
      return kDesktopHeaderHeight;
    }
    if (isTablet) {
      throw UnimplementedError();
    }
    if (isMobile) {
      return kMobileHeaderHeight;
    }
    throw UnimplementedError();
  }

  Widget headerBuilder(BuildContext context, int i, double h) {
    if (isDesktop) {
      return const DesktopMediaLibraryHeader(key: ValueKey(''));
    }
    if (isTablet) {
      throw UnimplementedError();
    }
    if (isMobile) {
      return const MobileMediaLibraryHeader(key: ValueKey(''));
    }
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Consumer<MediaLibrary>(
            builder: (context, mediaLibrary, _) {
              final scrollViewBuilderHelperData = ScrollViewBuilderHelper.instance.genre;

              return ScrollViewBuilder(
                margin: margin,
                span: scrollViewBuilderHelperData.span,
                headerCount: 1,
                headerBuilder: headerBuilder,
                headerHeight: headerHeight,
                itemCounts: [mediaLibrary.genres.length],
                itemBuilder: (context, i, j, w, h) => GenreItem(
                  key: mediaLibrary.genres[j].scrollViewBuilderKey,
                  genre: mediaLibrary.genres[j],
                  width: w,
                  height: h,
                ),
                labelConstraints: scrollViewBuilderHelperData.labelConstraints,
                labelTextStyle: scrollViewBuilderHelperData.labelTextStyle,
                itemWidth: scrollViewBuilderHelperData.itemWidth,
                itemHeight: scrollViewBuilderHelperData.itemHeight,
                padding: mediaLibraryScrollViewBuilderPadding,
              );
            },
          ),
        );
      },
    );
  }
}

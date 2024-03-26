import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:harmonoid/constants/language.dart';
import 'package:harmonoid/mappers/color.dart';
import 'package:harmonoid/ui/router.dart';
import 'package:harmonoid/utils/rendering.dart';

class MediaLibraryNoItemsBanner extends StatefulWidget {
  const MediaLibraryNoItemsBanner({super.key});

  @override
  State<MediaLibraryNoItemsBanner> createState() => MediaLibraryNoItemsBannerState();
}

class MediaLibraryNoItemsBannerState extends State<MediaLibraryNoItemsBanner> {
  static const _kImageWidth = 164.0;
  static const _kImageHeight = 164.0;
  static const _kImageAssetM3 = 'assets/vectors/0.svg';
  static const _kImageAssetM2Light = 'assets/vectors/0.svg';
  static const _kImageAssetM2Dark = 'assets/vectors/2.svg';

  SvgPicture? _imagePicture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isMaterial3) {
        final colorScheme = Theme.of(context).colorScheme;
        final result = await rootBundle.loadString(_kImageAssetM3);
        setState(() {
          _imagePicture = SvgPicture.string(
            result
                .replaceAll('"white"', '"${colorScheme.background.toHex()}"')
                .replaceAll('"black"', '"${colorScheme.onBackground.toHex()}"')
                .replaceAll('"#651FFF"', '"${colorScheme.primary.toHex()}"')
                .replaceAll('"#B388FF"', '"${colorScheme.inversePrimary.toHex()}"'),
            height: _kImageHeight,
            width: _kImageWidth,
            fit: BoxFit.contain,
          );
        });
      } else {
        setState(() {
          _imagePicture = SvgPicture.asset(
            Theme.of(context).brightness == Brightness.dark ? _kImageAssetM2Dark : _kImageAssetM2Light,
            height: _kImageHeight,
            width: _kImageWidth,
            fit: BoxFit.contain,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: mediaLibraryScrollViewBuilderPadding,
          constraints: const BoxConstraints(maxWidth: 480.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imagePicture ?? const SizedBox(height: _kImageHeight, width: _kImageWidth),
              const SizedBox(height: 16.0),
              Text(
                Language.instance.MEDIA_LIBRARY_NO_ITEMS_TITLE,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                Language.instance.MEDIA_LIBRARY_NO_ITEMS_SUBTITLE,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  context.push('/$kSettingsPath');
                },
                child: Text(label(Language.instance.GO_TO_SETTINGS)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

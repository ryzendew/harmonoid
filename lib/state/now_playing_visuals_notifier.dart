import 'dart:io';
import 'package:media_library/media_library.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

import 'package:harmonoid/core/configuration/configuration.dart';

/// {@template now_playing_visuals_notifier}
///
/// NowPlayingVisualsNotifier
/// -------------------------
/// Implementation to add, remove or retrieve now playing visuals.
///
/// {@endtemplate}
class NowPlayingVisualsNotifier {
  /// Singleton instance.
  static final NowPlayingVisualsNotifier instance = NowPlayingVisualsNotifier._();

  /// Whether the [instance] is initialized.
  static bool initialized = false;

  /// {@macro now_playing_visuals_notifier}
  NowPlayingVisualsNotifier._();

  /// Initializes the [instance].
  static Future<void> ensureInitialized() async {
    instance.directory = Directory(join(Configuration.instance.directory.path, 'UserVisuals'));
    if (await instance.directory.exists_()) {
      final directory = await instance.directory.list_();
      instance.external.addAll(directory.map((e) => e.path));
    } else {
      await instance.directory.create_();
    }
  }

  /// Directory.
  late final Directory directory;

  /// Bundled now playing visuals.
  final List<String> bundled = List.generate(kBundledVisualsCount, (index) => 'assets/visuals/$index.webp');

  /// External now playing visuals.
  final List<String> external = <String>[];

  /// Adds an external visual specified by [path].
  Future<void> add(String path) async {
    final path = join(directory.path, const Uuid().v4());
    await File(path).copy_(path);
    external.add(path);
  }

  /// Removes an external visual specified by [path].
  Future<void> remove(String path) async {
    await File(path).delete_();
    external.remove(path);
  }

  /// Count of bundled now playing visuals.
  static const kBundledVisualsCount = 9;

  /// Supported image formats.
  static const kSupportedImageFormats = [
    'JPG',
    'JPEG',
    'PNG',
    'WEBP',
    'GIF',
    'BMP',
    'TIF',
    'TIFF',
    'TGA',
  ];
}

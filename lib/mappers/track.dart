import 'package:media_library/media_library.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:harmonoid/models/playable.dart';
import 'package:harmonoid/ui/media_library/tracks/tracks_screen.dart';

/// Mappers for [Track].
extension TrackMappers on Track {
  /// Convert to [Playable].
  Playable toPlayable() => Playable(
        uri: uri,
        title: title,
        subtitle: [...artists.take(2)],
        description: [if (album.isNotEmpty) album.toString(), if (year != 0) year.toString()],
      );

  /// Convert to a [DataGridRow] used in [TracksScreen].
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell(columnName: TracksDataSource.kTrackNumber, value: this),
          DataGridCell(columnName: TracksDataSource.kTitle, value: this),
          DataGridCell(columnName: TracksDataSource.kArtists, value: this),
          DataGridCell(columnName: TracksDataSource.kAlbum, value: this),
          DataGridCell(columnName: TracksDataSource.kGenres, value: this),
          DataGridCell(columnName: TracksDataSource.kYear, value: this),
        ],
      );
}

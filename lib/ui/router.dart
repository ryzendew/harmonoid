import 'package:adaptive_layouts/adaptive_layouts.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:media_library/media_library.dart';

import 'package:harmonoid/core/configuration/configuration.dart';
import 'package:harmonoid/ui/home_screen.dart';
import 'package:harmonoid/ui/media_library/albums/album_screen.dart';
import 'package:harmonoid/ui/media_library/albums/albums_screen.dart';
import 'package:harmonoid/ui/media_library/artists/artist_screen.dart';
import 'package:harmonoid/ui/media_library/artists/artists_screen.dart';
import 'package:harmonoid/ui/media_library/genres/genre_screen.dart';
import 'package:harmonoid/ui/media_library/genres/genres_screen.dart';
import 'package:harmonoid/ui/media_library/media_library_screen.dart';
import 'package:harmonoid/ui/media_library/playlists/playlist_screen.dart';
import 'package:harmonoid/ui/media_library/playlists/playlists_screen.dart';
import 'package:harmonoid/ui/media_library/search/search_items_screen.dart';
import 'package:harmonoid/ui/media_library/search/search_screen.dart';
import 'package:harmonoid/ui/media_library/tracks/tracks_screen.dart';
import 'package:harmonoid/utils/material_transition_page.dart';

const String kMediaLibraryPath = 'media-library';

const String kAlbumsPath = 'albums';

const String kTracksPath = 'tracks';

const String kArtistsPath = 'artists';

const String kGenresPath = 'genres';

const String kPlaylistsPath = 'playlists';

const String kSearchPath = 'search';
const String kSearchArgQuery = 'query';

const String kSearchItemsPath = 'search-items';

class SearchItemsPathExtra {
  final String query;
  final List<MediaLibraryItem> items;
  const SearchItemsPathExtra({
    required this.query,
    required this.items,
  });
}

const String kAlbumPath = 'album';

class AlbumPathExtra {
  final Album album;
  final List<Track> tracks;
  final List<Color>? palette;
  const AlbumPathExtra({
    required this.album,
    required this.tracks,
    required this.palette,
  });
}

const String kArtistPath = 'artist';

class ArtistPathExtra {
  final Artist artist;
  final List<Track> tracks;
  final List<Color>? palette;
  const ArtistPathExtra({
    required this.artist,
    required this.tracks,
    required this.palette,
  });
}

const String kGenrePath = 'genre';

class GenrePathExtra {
  final Genre genre;
  final List<Track> tracks;
  final List<Color>? palette;
  const GenrePathExtra({
    required this.genre,
    required this.tracks,
    required this.palette,
  });
}

const String kPlaylistPath = 'playlist';

class PlaylistPathExtra {
  final Playlist playlist;
  final List<PlaylistEntry> entries;
  final List<Color>? palette;
  const PlaylistPathExtra({
    required this.playlist,
    required this.entries,
    required this.palette,
  });
}

const String kSettingsPath = 'settings';

const String kModernNowPlayingPath = 'modern-now-playing-screen';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: homeNavigatorKey,
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => '/$kMediaLibraryPath/${Configuration.instance.mediaLibraryPath}',
        ),
        GoRoute(
          path: '/$kMediaLibraryPath',
          redirect: (_, state) => state.uri.toString(),
          routes: [
            ShellRoute(
              builder: (context, state, child) {
                return MediaLibraryScreen(child: child);
              },
              routes: [
                GoRoute(
                  path: kAlbumsPath,
                  pageBuilder: (context, state) {
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: const AlbumsScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: kTracksPath,
                  pageBuilder: (context, state) {
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: const TracksScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: kArtistsPath,
                  pageBuilder: (context, state) {
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: const ArtistsScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: kGenresPath,
                  pageBuilder: (context, state) {
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: const GenresScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: kPlaylistsPath,
                  pageBuilder: (context, state) {
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: const PlaylistsScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: kSearchPath,
                  pageBuilder: (context, state) {
                    final query = state.uri.queryParameters[kSearchArgQuery] ?? '';
                    return buildPageWithMediaLibraryTransition(
                      context: context,
                      state: state,
                      child: SearchScreen(query: query),
                      key: ValueKey(state.uri.toString()),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: kSearchItemsPath,
              pageBuilder: (context, state) {
                final extra = state.extra as SearchItemsPathExtra;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SearchItemsScreen(
                    query: extra.query,
                    items: extra.items,
                  ),
                );
              },
            ),
            GoRoute(
              path: kAlbumPath,
              pageBuilder: (context, state) {
                final extra = state.extra as AlbumPathExtra;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: AlbumScreen(
                    album: extra.album,
                    tracks: extra.tracks,
                    palette: extra.palette,
                  ),
                );
              },
            ),
            GoRoute(
              path: kArtistPath,
              pageBuilder: (context, state) {
                final extra = state.extra as ArtistPathExtra;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ArtistScreen(
                    artist: extra.artist,
                    tracks: extra.tracks,
                    palette: extra.palette,
                  ),
                );
              },
            ),
            GoRoute(
              path: kGenrePath,
              pageBuilder: (context, state) {
                final extra = state.extra as GenrePathExtra;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: GenreScreen(
                    genre: extra.genre,
                    tracks: extra.tracks,
                    palette: extra.palette,
                  ),
                );
              },
            ),
            GoRoute(
              path: kPlaylistPath,
              pageBuilder: (context, state) {
                final extra = state.extra as PlaylistPathExtra;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: PlaylistScreen(
                    playlist: extra.playlist,
                    entries: extra.entries,
                    palette: extra.palette,
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/$kSettingsPath',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SizedBox(),
            );
          },
        ),
        GoRoute(
          path: '/$kModernNowPlayingPath',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SizedBox(),
            );
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage<T> buildPageWithMediaLibraryTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  ValueKey? key,
}) {
  return CustomTransitionPage<T>(
    key: key ?? state.pageKey,
    child: child,
    transitionDuration: Theme.of(context).extension<AnimationDuration>()?.medium ?? Duration.zero,
    reverseTransitionDuration: Theme.of(context).extension<AnimationDuration>()?.medium ?? Duration.zero,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.vertical,
      child: child,
    ),
  );
}

MaterialTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  ValueKey? key,
}) {
  return MaterialTransitionPage<T>(
    key: key ?? state.pageKey,
    child: child,
  );
}

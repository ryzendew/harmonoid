// ignore_for_file: non_constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:harmonoid/constants/strings.dart';

/// {@template language_data}
///
/// LanguageData
/// ------------
///
/// {@endtemplate}
class LanguageData {
  /// Code.
  /// e.g. `en_US`.
  final String code;

  /// Name.
  /// e.g. `English (United States)`.
  final String name;

  /// Country.
  /// e.g. `United States`.
  final String country;

  /// {@macro language_data}
  const LanguageData({
    required this.code,
    required this.name,
    required this.country,
  });

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LanguageData && other.code == code && other.name == name && other.country == country;
  }

  factory LanguageData.fromJson(dynamic json) => LanguageData(
        code: json['code'],
        name: json['name'],
        country: json['country'],
      );

  Map<String, String> toJson() => {
        'code': code,
        'name': name,
        'country': country,
      };
}

/// {@template language}
///
/// Language
/// --------
/// Implementation to set the current language & retrieve localized strings from the assets.
///
/// {@endtemplate}
class Language extends Strings with ChangeNotifier {
  /// Singleton instance.
  static final Language instance = Language._();

  /// Whether the [instance] is initialized.
  static bool initialized = false;

  /// Initializes the [instance].
  static Future<void> ensureInitialized({required LanguageData language}) async {
    if (initialized) return;
    initialized = true;
    await instance.set(value: language);
  }

  /// {@macro language}
  Language._();

  /// Current language.
  late LanguageData current;

  /// Returns all the available languages after reading the assets.
  Future<Set<LanguageData>> get all async {
    final data = await rootBundle.loadString('assets/translations/index.json');
    return Set.from(json.decode(data).map((e) => LanguageData.fromJson(e)));
  }

  /// Sets the current language.
  Future<void> set({required LanguageData value}) async {
    final data = await rootBundle.loadString('assets/translations/translations/${value.code}.json');
    final map = json.decode(data);
    ABOUT = map['ABOUT']!;
    ADD = map['ADD']!;
    ADDED_M_OF_N_FILES = map['ADDED_M_OF_N_FILES']!;
    ADDING_YOUR_MUSIC = map['ADDING_YOUR_MUSIC']!;
    ADD_NEW_FOLDER = map['ADD_NEW_FOLDER']!;
    ADD_THIS_FOLDER = map['ADD_THIS_FOLDER']!;
    ADD_TO_NOW_PLAYING = map['ADD_TO_NOW_PLAYING']!;
    ADD_TO_PLAYLIST = map['ADD_TO_PLAYLIST']!;
    ALBUM = map['ALBUM']!;
    ALBUMS = map['ALBUMS']!;
    ALBUM_ARTIST = map['ALBUM_ARTIST']!;
    ALBUM_ARTISTS = map['ALBUM_ARTISTS']!;
    ALBUM_DELETE_DIALOG_SUBTITLE = map['ALBUM_DELETE_DIALOG_SUBTITLE']!;
    ALL_FILES = map['ALL_FILES']!;
    ARTIST = map['ARTIST']!;
    ARTISTS = map['ARTISTS']!;
    ASCENDING = map['ASCENDING']!;
    AVAILABLE_STORAGES = map['AVAILABLE_STORAGES']!;
    AWESOME = map['AWESOME']!;
    A_TO_Z = map['A_TO_Z']!;
    BETA = map['BETA']!;
    BUFFERING = map['BUFFERING']!;
    CANCEL = map['CANCEL']!;
    CLEAR_LRC_FILE = map['CLEAR_LRC_FILE']!;
    COMING_UP = map['COMING_UP']!;
    CONTROL_PANEL = map['CONTROL_PANEL']!;
    COPY_AS_JSON = map['COPY_AS_JSON']!;
    COPY_LINK = map['COPY_LINK']!;
    CORRUPT_LRC_FILE = map['CORRUPT_LRC_FILE']!;
    COUNT = map['COUNT']!;
    CREATE = map['CREATE']!;
    CREATE_NEW_PLAYLIST = map['CREATE_NEW_PLAYLIST']!;
    DATE_ADDED = map['DATE_ADDED']!;
    DELETE = map['DELETE']!;
    DESCENDING = map['DESCENDING']!;
    DISCOVERING_FILES = map['DISCOVERING_FILES']!;
    DONATE = map['DONATE']!;
    DONE = map['DONE']!;
    EDIT = map['EDIT']!;
    EDIT_ALBUM_PARAMETERS_SUBTITLE = map['EDIT_ALBUM_PARAMETERS_SUBTITLE']!;
    EDIT_ALBUM_PARAMETERS_SUBTITLE_ = map['EDIT_ALBUM_PARAMETERS_SUBTITLE_']!;
    EDIT_ALBUM_PARAMETERS_TITLE = map['EDIT_ALBUM_PARAMETERS_TITLE']!;
    EDIT_DETAILS = map['EDIT_DETAILS']!;
    EDIT_MINIMUM_FILE_SIZE = map['EDIT_MINIMUM_FILE_SIZE']!;
    ENABLE_ANIMATION_EFFECTS = map['ENABLE_ANIMATION_EFFECTS']!;
    ENABLE_DISCORD_RPC = map['ENABLE_DISCORD_RPC']!;
    ENABLE_VOLUME_BOOST_FILTER = map['ENABLE_VOLUME_BOOST_FILTER']!;
    ENABLE_VOLUME_BOOST_FILTER_WARNING = map['ENABLE_VOLUME_BOOST_FILTER_WARNING']!;
    ENTRIES = map['ENTRIES']!;
    ENTRY = map['ENTRY']!;
    ERROR = map['ERROR']!;
    EXIT_FULLSCREEN = map['EXIT_FULLSCREEN']!;
    EXIT_NOW_PLAYING = map['EXIT_NOW_PLAYING']!;
    EXIT_SUBTITLE = map['EXIT_SUBTITLE']!;
    EXIT_TITLE = map['EXIT_TITLE']!;
    EXPERIMENTAL = map['EXPERIMENTAL']!;
    EXPERIMENTAL_SUBTITLE = map['EXPERIMENTAL_SUBTITLE']!;
    FALLBACK_ALBUM_ARTS = map['FALLBACK_ALBUM_ARTS']!;
    FILE = map['FILE']!;
    FILE_INFORMATION = map['FILE_INFORMATION']!;
    FILE_PATH_OR_URL = map['FILE_PATH_OR_URL']!;
    FOLDERS_NOT_FOUND = map['FOLDERS_NOT_FOUND']!;
    FOLDERS_NOT_FOUND_SUBTITLE = map['FOLDERS_NOT_FOUND_SUBTITLE']!;
    FOLDER_NOT_FOUND = map['FOLDER_NOT_FOUND']!;
    FULLSCREEN = map['FULLSCREEN']!;
    GENRE = map['GENRE']!;
    GENRES = map['GENRES']!;
    GO_TO_SETTINGS = map['GO_TO_SETTINGS']!;
    HIDE = map['HIDE']!;
    HIDE_LYRICS = map['HIDE_LYRICS']!;
    HISTORY = map['HISTORY']!;
    IMAGES = map['IMAGES']!;
    IMPORT = map['IMPORT']!;
    INTERNET_ERROR = map['INTERNET_ERROR']!;
    LAST_DIRECTORY_REMOVED = map['LAST_DIRECTORY_REMOVED']!;
    LESS = map['LESS']!;
    LIBRARY = map['LIBRARY']!;
    LIKED_SONGS = map['LIKED_SONGS']!;
    LYRICS = map['LYRICS']!;
    LYRICS_NOT_FOUND = map['LYRICS_NOT_FOUND']!;
    LYRICS_RETRIEVING = map['LYRICS_RETRIEVING']!;
    MEDIA_FILES = map['MEDIA_FILES']!;
    MEDIA_LIBRARY_NO_ITEMS_SUBTITLE = map['MEDIA_LIBRARY_NO_ITEMS_SUBTITLE']!;
    MEDIA_LIBRARY_NO_ITEMS_TITLE = map['MEDIA_LIBRARY_NO_ITEMS_TITLE']!;
    MEDIA_LIBRARY_REFRESHING_DIALOG_SUBTITLE = map['MEDIA_LIBRARY_REFRESHING_DIALOG_SUBTITLE']!;
    MENU = map['MENU']!;
    MINIMUM_FILE_SIZE = map['MINIMUM_FILE_SIZE']!;
    MINIMUM_FILE_SIZE_WARNING = map['MINIMUM_FILE_SIZE_WARNING']!;
    MOBILE_ALBUM_GRID_SIZE = map['MOBILE_ALBUM_GRID_SIZE']!;
    MOBILE_ARTIST_GRID_SIZE = map['MOBILE_ARTIST_GRID_SIZE']!;
    MOBILE_ENABLE_NOW_PLAYING_RIPPLE_EFFECT = map['MOBILE_ENABLE_NOW_PLAYING_RIPPLE_EFFECT']!;
    MOBILE_ENABLE_VOLUME_SLIDER = map['MOBILE_ENABLE_VOLUME_SLIDER']!;
    MOBILE_GENRE_GRID_SIZE = map['MOBILE_GENRE_GRID_SIZE']!;
    MORE = map['MORE']!;
    MUTE = map['MUTE']!;
    M_TRACKS_AND_N_ALBUMS = map['M_TRACKS_AND_N_ALBUMS']!;
    NEXT = map['NEXT']!;
    NO = map['NO']!;
    NOTHING_IN_QUEUE = map['NOTHING_IN_QUEUE']!;
    NOTIFICATION_LYRICS_SUBTITLE = map['NOTIFICATION_LYRICS_SUBTITLE']!;
    NOTIFICATION_LYRICS_TITLE = map['NOTIFICATION_LYRICS_TITLE']!;
    NOW_PLAYING = map['NOW_PLAYING']!;
    NOW_PLAYING_SCREEN = map['NOW_PLAYING_SCREEN']!;
    NOW_PLAYING_SCREEN_SETTING_SUBTITLE = map['NOW_PLAYING_SCREEN_SETTING_SUBTITLE']!;
    NOW_YOU_ARE_GOOD_TO_GO_BACK = map['NOW_YOU_ARE_GOOD_TO_GO_BACK']!;
    NO_DOWNLOAD_UPDATE = map['NO_DOWNLOAD_UPDATE']!;
    NO_INTERNET_SUBTITLE = map['NO_INTERNET_SUBTITLE']!;
    NO_INTERNET_TITLE = map['NO_INTERNET_TITLE']!;
    NO_PLAYLISTS_FOUND = map['NO_PLAYLISTS_FOUND']!;
    N_ALBUMS = map['N_ALBUMS']!;
    N_ARTISTS = map['N_ARTISTS']!;
    N_ENTRIES = map['N_ENTRIES']!;
    N_GENRES = map['N_GENRES']!;
    N_TRACKS = map['N_TRACKS']!;
    OK = map['OK']!;
    OPEN_FILE_OR_URL = map['OPEN_FILE_OR_URL']!;
    OPEN_IN_BROWSER = map['OPEN_IN_BROWSER']!;
    OPTIONS = map['OPTIONS']!;
    ORDER = map['ORDER']!;
    PAUSE = map['PAUSE']!;
    PERMISSIONS = map['PERMISSIONS']!;
    PERMISSIONS_SUBTITLE = map['PERMISSIONS_SUBTITLE']!;
    PERMISSION_IMAGES_AND_PHOTOS = map['PERMISSION_IMAGES_AND_PHOTOS']!;
    PERMISSION_IMAGES_AND_PHOTOS_SUBTITLE = map['PERMISSION_IMAGES_AND_PHOTOS_SUBTITLE']!;
    PERMISSION_MUSIC_AND_AUDIO = map['PERMISSION_MUSIC_AND_AUDIO']!;
    PERMISSION_MUSIC_AND_AUDIO_SUBTITLE = map['PERMISSION_MUSIC_AND_AUDIO_SUBTITLE']!;
    PERMISSION_NOTIFICATIONS = map['PERMISSION_NOTIFICATIONS']!;
    PERMISSION_NOTIFICATIONS_SUBTITLE = map['PERMISSION_NOTIFICATIONS_SUBTITLE']!;
    PHONE = map['PHONE']!;
    PITCH = map['PITCH']!;
    PLAY = map['PLAY']!;
    PLAYLIST = map['PLAYLIST']!;
    PLAYLISTS = map['PLAYLISTS']!;
    PLAYLIST_ADD_DIALOG_SUBTITLE = map['PLAYLIST_ADD_DIALOG_SUBTITLE']!;
    PLAYLIST_ADD_DIALOG_TITLE = map['PLAYLIST_ADD_DIALOG_TITLE']!;
    PLAYLIST_CREATE_DIALOG_SUBTITLE = map['PLAYLIST_CREATE_DIALOG_SUBTITLE']!;
    PLAYLIST_DELETE_DIALOG_SUBTITLE = map['PLAYLIST_DELETE_DIALOG_SUBTITLE']!;
    PLAYLIST_ENTRY_REMOVE_DIALOG_SUBTITLE = map['PLAYLIST_ENTRY_REMOVE_DIALOG_SUBTITLE']!;
    PLAYLIST_RENAME_DIALOG_SUBTITLE = map['PLAYLIST_RENAME_DIALOG_SUBTITLE']!;
    PLAY_ALL = map['PLAY_ALL']!;
    PLAY_NOW = map['PLAY_NOW']!;
    PLAY_URL = map['PLAY_URL']!;
    PLAY_URL_SUBTITLE = map['PLAY_URL_SUBTITLE']!;
    PREVIOUS = map['PREVIOUS']!;
    PROPERTY = map['PROPERTY']!;
    READ = map['READ']!;
    READ_METADATA = map['READ_METADATA']!;
    RECOMMENDATIONS = map['RECOMMENDATIONS']!;
    RECOMMENDED_HINT = map['RECOMMENDED_HINT']!;
    REFRESH = map['REFRESH']!;
    REFRESH_INFORMATION = map['REFRESH_INFORMATION']!;
    REFRESH_SUBTITLE = map['REFRESH_SUBTITLE']!;
    REINDEX = map['REINDEX']!;
    REINDEX_INFORMATION = map['REINDEX_INFORMATION']!;
    REINDEX_SUBTITLE = map['REINDEX_SUBTITLE']!;
    REMIND_ME_NEXT_TIME = map['REMIND_ME_NEXT_TIME']!;
    REMOVE = map['REMOVE']!;
    REMOVE_FROM_PLAYLIST = map['REMOVE_FROM_PLAYLIST']!;
    RENAME = map['RENAME']!;
    REPEAT = map['REPEAT']!;
    RESET_PITCH = map['RESET_PITCH']!;
    RESET_SPEED = map['RESET_SPEED']!;
    RESTORE = map['RESTORE']!;
    RESTORE_DEFAULTS = map['RESTORE_DEFAULTS']!;
    RESULTS_FOR_QUERY = map['RESULTS_FOR_QUERY']!;
    SAVE = map['SAVE']!;
    SAVE_AS_PLAYLIST = map['SAVE_AS_PLAYLIST']!;
    SD_CARD = map['SD_CARD']!;
    SEARCH = map['SEARCH']!;
    SEARCH_BANNER_NO_ITEMS_SUBTITLE = map['SEARCH_BANNER_NO_ITEMS_SUBTITLE']!;
    SEARCH_BANNER_NO_ITEMS_TITLE = map['SEARCH_BANNER_NO_ITEMS_TITLE']!;
    SEARCH_BANNER_SUBTITLE = map['SEARCH_BANNER_SUBTITLE']!;
    SEARCH_BANNER_TITLE = map['SEARCH_BANNER_TITLE']!;
    SEARCH_HINT = map['SEARCH_HINT']!;
    SEE_ALL = map['SEE_ALL']!;
    SELECTED_DIRECTORIES = map['SELECTED_DIRECTORIES']!;
    SELECTED_DIRECTORY = map['SELECTED_DIRECTORY']!;
    SETTINGS = map['SETTINGS']!;
    SETTINGS_DISPLAY_AUDIO_FORMAT = map['SETTINGS_DISPLAY_AUDIO_FORMAT']!;
    SETTINGS_HIGHLIGHTED_LYRICS_SIZE = map['SETTINGS_HIGHLIGHTED_LYRICS_SIZE']!;
    SETTINGS_LAUNCH_NOW_PLAYING_ON_FILE_OPEN = map['SETTINGS_LAUNCH_NOW_PLAYING_ON_FILE_OPEN']!;
    SETTINGS_LRC_FROM_DIRECTORY = map['SETTINGS_LRC_FROM_DIRECTORY']!;
    SETTINGS_MEDIA_LIBRARY_REFRESH_ON_LAUNCH = map['SETTINGS_MEDIA_LIBRARY_REFRESH_ON_LAUNCH']!;
    SETTINGS_SECTION_STATS_SUBTITLE = map['SETTINGS_SECTION_STATS_SUBTITLE']!;
    SETTINGS_SECTION_STATS_TITLE = map['SETTINGS_SECTION_STATS_TITLE']!;
    SETTINGS_SECTION_VISUALS_SUBTITLE = map['SETTINGS_SECTION_VISUALS_SUBTITLE']!;
    SETTINGS_SECTION_VISUALS_TITLE = map['SETTINGS_SECTION_VISUALS_TITLE']!;
    SETTINGS_SHOW_TRACK_PROGRESS_ON_TASKBAR = map['SETTINGS_SHOW_TRACK_PROGRESS_ON_TASKBAR']!;
    SETTINGS_SHOW_TRACK_PROGRESS_ON_TASKBAR_SUBTITLE = map['SETTINGS_SHOW_TRACK_PROGRESS_ON_TASKBAR_SUBTITLE']!;
    SETTINGS_SPEED_ANIMATION_EFFECTS = map['SETTINGS_SPEED_ANIMATION_EFFECTS']!;
    SETTINGS_UNHIGHLIGHTED_LYRICS_SIZE = map['SETTINGS_UNHIGHLIGHTED_LYRICS_SIZE']!;
    SETTING_ACCENT_COLOR_AUTOMATIC = map['SETTING_ACCENT_COLOR_AUTOMATIC']!;
    SETTING_ACCENT_COLOR_SUBTITLE = map['SETTING_ACCENT_COLOR_SUBTITLE']!;
    SETTING_ACCENT_COLOR_TITLE = map['SETTING_ACCENT_COLOR_TITLE']!;
    SETTING_APP_VERSION_INSTALLED = map['SETTING_APP_VERSION_INSTALLED']!;
    SETTING_APP_VERSION_LATEST = map['SETTING_APP_VERSION_LATEST']!;
    SETTING_APP_VERSION_SUBTITLE = map['SETTING_APP_VERSION_SUBTITLE']!;
    SETTING_APP_VERSION_TITLE = map['SETTING_APP_VERSION_TITLE']!;
    SETTING_DISPLAY_SUBTITLE = map['SETTING_DISPLAY_SUBTITLE']!;
    SETTING_DISPLAY_TITLE = map['SETTING_DISPLAY_TITLE']!;
    SETTING_INDEXING_SUBTITLE = map['SETTING_INDEXING_SUBTITLE']!;
    SETTING_INDEXING_TITLE = map['SETTING_INDEXING_TITLE']!;
    SETTING_LANGUAGE_SUBTITLE = map['SETTING_LANGUAGE_SUBTITLE']!;
    SETTING_LANGUAGE_TITLE = map['SETTING_LANGUAGE_TITLE']!;
    SETTING_MISCELLANEOUS_SUBTITLE = map['SETTING_MISCELLANEOUS_SUBTITLE']!;
    SETTING_MISCELLANEOUS_TITLE = map['SETTING_MISCELLANEOUS_TITLE']!;
    SETTING_THEME_SUBTITLE = map['SETTING_THEME_SUBTITLE']!;
    SETTING_THEME_TITLE = map['SETTING_THEME_TITLE']!;
    SET_LRC_FILE = map['SET_LRC_FILE']!;
    SHARE = map['SHARE']!;
    SHOW_ALBUM = map['SHOW_ALBUM']!;
    SHOW_IN_FILE_MANAGER = map['SHOW_IN_FILE_MANAGER']!;
    SHOW_LYRICS = map['SHOW_LYRICS']!;
    SHOW_NOW_PLAYING_SCREEN = map['SHOW_NOW_PLAYING_SCREEN']!;
    SHUFFLE = map['SHUFFLE']!;
    SORT = map['SORT']!;
    SORT_BY = map['SORT_BY']!;
    SPEED = map['SPEED']!;
    THEME_MODE_DARK = map['THEME_MODE_DARK']!;
    THEME_MODE_LIGHT = map['THEME_MODE_LIGHT']!;
    THEME_MODE_SYSTEM = map['THEME_MODE_SYSTEM']!;
    TITLE = map['TITLE']!;
    TRACK = map['TRACK']!;
    TRACKS = map['TRACKS']!;
    TRACK_DELETE_DIALOG_SUBTITLE = map['TRACK_DELETE_DIALOG_SUBTITLE']!;
    TRACK_NUMBER = map['TRACK_NUMBER']!;
    TYPE = map['TYPE']!;
    UNMUTE = map['UNMUTE']!;
    URL = map['URL']!;
    USE_MODERN_NOW_PLAYING_SCREEN = map['USE_MODERN_NOW_PLAYING_SCREEN']!;
    USE_THESE_CHARACTERS_TO_SEPARATE_ARTISTS = map['USE_THESE_CHARACTERS_TO_SEPARATE_ARTISTS']!;
    VALUE = map['VALUE']!;
    WARNING = map['WARNING']!;
    YEAR = map['YEAR']!;
    YES = map['YES']!;
    current = value;
    notifyListeners();
  }
}

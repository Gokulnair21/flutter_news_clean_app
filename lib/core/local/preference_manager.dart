abstract class PreferenceManager {
  Future<void> initialize();

  Future<bool> isDarkModeEnabled();

  Future<void> enableDarkMode(bool status);

  Future<void> dispose();
}

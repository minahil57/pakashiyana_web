String _iconPath = 'assets/icons';
String _imagePath = 'assets/images';
String _logoPath = 'assets/logo';

class AssetManager {
  static String images(String name) => '$_imagePath/$name';
  static String icons(String name) => '$_iconPath/$name';
  static String logo(String name) => '$_logoPath/$name';
}

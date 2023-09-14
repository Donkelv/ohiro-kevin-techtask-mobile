extension StringExtensions on String {
  String get svg => 'asset/svg/$this.svg';
  String get png => 'asset/png/$this.png';
  String get pngTemp => 'asset/png/temp/$this.png';
  String get gif => 'asset/gif/$this.gif';
  String get json => 'asset/json/$this.json';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

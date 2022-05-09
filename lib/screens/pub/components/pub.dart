class Pub {
  final String pubName;
  String openingHours;
  String address;
  String requirements;
  String description;
  String prices;
  String entry;
  List<String> images = <String>[];

  Pub( {
    required this.pubName,
    this.openingHours = 'Opening hours unknown.',
    this.address = 'No address given.',
    this.requirements = 'No requirements specified.',
    this.description = 'No description.',
    this.prices = 'No price information given.',
    this.entry = 'No entry information given.',
  });

  void setHours(String hours){
    openingHours = hours;
  }
}
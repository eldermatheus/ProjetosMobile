class Animal {
  const Animal({
    required this.id,
    required this.scientificName,
    required this.commonName,
    required this.completeName,
    required this.author,
    required this.rankString,
    required this.nameAuthority,
    required this.kingdom,
    required this.phylum,
    required this.classe,
    required this.order,
    required this.suborder,
    required this.family,
    required this.genus,
    required this.imageUrl,
    required this.dataLink,
    required this.imageAuthor,
    required this.conservationState,
    required this.geographicDistribution,
  });

  final String id;
  final String scientificName;
  final String commonName;
  final String completeName;
  final String author;
  final String rankString;
  final String nameAuthority;
  final String kingdom;
  final String phylum;
  final String classe;
  final String order;
  final String suborder;
  final String family;
  final String genus;
  final String imageUrl;
  final String dataLink;
  final String imageAuthor;
  final String conservationState;
  final String geographicDistribution;
}

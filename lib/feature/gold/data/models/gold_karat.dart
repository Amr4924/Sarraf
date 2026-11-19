class GoldKarat {
  String karat;
  String purePercent;

  GoldKarat({required this.karat, required this.purePercent});
}

final List<GoldKarat> goldKaratList = [
  GoldKarat(karat: "24", purePercent: "99.9% pure"),
  GoldKarat(karat: "22", purePercent: "91.7% pure"),
  GoldKarat(karat: "21", purePercent: "87.5% pure"),
  GoldKarat(karat: "18", purePercent: "75% pure"),
];

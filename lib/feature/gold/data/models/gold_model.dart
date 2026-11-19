class GoldModel {
  bool? success;
  String? provider;
  String? generatedAt;
  String? sourceUpdatedAt;
  bool? stale;
  double? usdEgp;
  Gold? gold;
  List<String>? notes;
  String? cache;

  GoldModel({
    this.success,
    this.provider,
    this.generatedAt,
    this.sourceUpdatedAt,
    this.stale,
    this.usdEgp,
    this.gold,
    this.notes,
    this.cache,
  });

  GoldModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    provider = json['provider'];
    generatedAt = json['generated_at'];
    sourceUpdatedAt = json['source_updated_at'];
    stale = json['stale'];
    usdEgp = (json['usd_egp'] as num?)?.toDouble();
    gold = json['gold'] != null ? Gold.fromJson(json['gold']) : null;
    notes = json['notes'] != null ? List<String>.from(json['notes']) : null;
    cache = json['cache'];
  }
}

class Gold {
  double? ounceUsd;
  double? ounceEgp;
  Gram? gram;
  double? goldPound21k;

  Gold({this.ounceUsd, this.ounceEgp, this.gram, this.goldPound21k});

  Gold.fromJson(Map<String, dynamic> json) {
    ounceUsd = (json['ounce_usd'] as num?)?.toDouble();
    ounceEgp = (json['ounce_egp'] as num?)?.toDouble();
    gram = json['gram'] != null ? Gram.fromJson(json['gram']) : null;
    goldPound21k = (json['gold_pound_21k'] as num?)?.toDouble();
  }
}

class Gram {
  double? d24k;
  double? d22k;
  double? d21k;
  double? d18k;
  double? d14k;

  Gram({this.d24k, this.d22k, this.d21k, this.d18k, this.d14k});

  Gram.fromJson(Map<String, dynamic> json) {
    d24k = (json['24k'] as num?)?.toDouble();
    d22k = (json['22k'] as num?)?.toDouble();
    d21k = (json['21k'] as num?)?.toDouble();
    d18k = (json['18k'] as num?)?.toDouble();
    d14k = (json['14k'] as num?)?.toDouble();
  }
}

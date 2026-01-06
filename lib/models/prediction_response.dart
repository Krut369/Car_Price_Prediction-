class PredictionResponse {
  final double predictedPrice;
  final double depreciation;
  final double depreciationPercent;
  final double lowerEstimate;
  final double upperEstimate;

  PredictionResponse({
    required this.predictedPrice,
    required this.depreciation,
    required this.depreciationPercent,
    required this.lowerEstimate,
    required this.upperEstimate,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(
      predictedPrice: json["predicted_price"].toDouble(),
      depreciation: json["depreciation"].toDouble(),
      depreciationPercent: json["depreciation_percent"].toDouble(),
      lowerEstimate: json["lower_estimate"].toDouble(),
      upperEstimate: json["upper_estimate"].toDouble(),
    );
  }
}

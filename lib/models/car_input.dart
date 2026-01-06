class CarInput {
  final int year;
  final double presentPrice;
  final int kmsDriven;
  final String fuelType;
  final String sellerType;
  final String transmission;
  final int owner;

  CarInput({
    required this.year,
    required this.presentPrice,
    required this.kmsDriven,
    required this.fuelType,
    required this.sellerType,
    required this.transmission,
    required this.owner,
  });

  Map<String, dynamic> toJson() => {
    "year": year,
    "present_price": presentPrice,
    "kms_driven": kmsDriven,
    "fuel_type": fuelType,
    "seller_type": sellerType,
    "transmission": transmission,
    "owner": owner,
  };
}

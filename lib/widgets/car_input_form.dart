import 'package:flutter/material.dart';
import '../models/car_input.dart';
import '../theme/app_theme.dart';

class CarInputForm extends StatefulWidget {
  final Function(CarInput) onPredict;
  final bool loading;

  const CarInputForm({
    super.key,
    required this.onPredict,
    required this.loading,
  });

  @override
  State<CarInputForm> createState() => _CarInputFormState();
}

class _CarInputFormState extends State<CarInputForm> {
  final _formKey = GlobalKey<FormState>();

  int year = 2018;
  double presentPrice = 6.5;
  int kmsDriven = 45000;
  String fuelType = "Petrol";
  String sellerType = "Individual";
  String transmission = "Manual";
  int owner = 1;

  final List<String> fuelTypes = ["Petrol", "Diesel", "CNG"];
  final List<String> sellerTypes = ["Individual", "Dealer"];
  final List<String> transmissions = ["Manual", "Automatic"];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final car = CarInput(
        year: year,
        presentPrice: presentPrice,
        kmsDriven: kmsDriven,
        fuelType: fuelType,
        sellerType: sellerType,
        transmission: transmission,
        owner: owner,
      );
      widget.onPredict(car);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Vehicle Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              _buildYearSlider(),
              const SizedBox(height: 20),
              _buildPriceSlider(),
              const SizedBox(height: 20),
              _buildKmsSlider(),
              const SizedBox(height: 24),
              _buildDropdowns(),
              const SizedBox(height: 24),
              _buildOwnerSelector(),
              const SizedBox(height: 28),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYearSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Manufacturing Year: $year',
            style: AppTheme.labelStyle),
        Slider(
          value: year.toDouble(),
          min: 2000,
          max: 2024,
          divisions: 24,
          activeColor: AppTheme.primary,
          onChanged: (value) => setState(() => year = value.toInt()),
        ),
      ],
    );
  }

  Widget _buildPriceSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Current Price: ₹${presentPrice.toStringAsFixed(2)} L',
            style: AppTheme.labelStyle),
        Slider(
          value: presentPrice,
          min: 0.5,
          max: 30.0,
          divisions: 59,
          activeColor: AppTheme.primary,
          onChanged: (value) => setState(() => presentPrice = value),
        ),
      ],
    );
  }

  Widget _buildKmsSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kilometers Driven: ${kmsDriven.toString()} km',
            style: AppTheme.labelStyle),
        Slider(
          value: kmsDriven.toDouble(),
          min: 0,
          max: 200000,
          divisions: 40,
          activeColor: AppTheme.primary,
          onChanged: (value) => setState(() => kmsDriven = value.toInt()),
        ),
      ],
    );
  }

  Widget _buildDropdowns() {
    return Row(
      children: [
        Expanded(child: _buildDropdown('Fuel', fuelType, fuelTypes,
                (val) => setState(() => fuelType = val!))),
        const SizedBox(width: 12),
        Expanded(child: _buildDropdown('Seller', sellerType, sellerTypes,
                (val) => setState(() => sellerType = val!))),
        const SizedBox(width: 12),
        Expanded(child: _buildDropdown('Transmission', transmission,
            transmissions, (val) => setState(() => transmission = val!))),
      ],
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items,
      Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true                                                                              ,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: items.map((item) =>
          DropdownMenuItem(value: item, child: Text(item,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildOwnerSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Number of Owners', style: AppTheme.labelStyle),
        const SizedBox(height: 12),
        Row(
          children: List.generate(4, (index) {
            final ownerNum = index + 1;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ChoiceChip(
                label: Text('$ownerNum'),
                selected: owner == ownerNum,
                onSelected: (_) => setState(() => owner = ownerNum),
                selectedColor: AppTheme.primary,
                labelStyle: TextStyle(
                  color: owner == ownerNum ? Colors.white : Colors.black87,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: widget.loading ? null : _submit,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(
        widget.loading ? 'Predicting...' : 'Predict Price',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
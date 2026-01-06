import 'package:flutter/material.dart';
import '../models/prediction_response.dart';
import '../models/car_input.dart';
import '../theme/app_theme.dart';

class PredictionResultCard extends StatelessWidget {
  final PredictionResponse result;
  final CarInput input;

  const PredictionResultCard({
    super.key,
    required this.result,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: AppTheme.primary.withOpacity(0.3),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildPriceSection(),
          _buildDivider(),
          _buildDetailsGrid(),
          _buildDivider(),
          _buildInputSummary(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer, color: Colors.white, size: 28),
          const SizedBox(width: 12),
          Text(
            'Prediction Result',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Predicted Selling Price',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${result.predictedPrice.toStringAsFixed(2)} L',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(child: _buildDetailItem(
            'Depreciation',
            '₹${result.depreciation.toStringAsFixed(2)} L',
            '${result.depreciationPercent.toStringAsFixed(1)}%',
            Icons.trending_down,
            Colors.orange,
          )),
          Expanded(child: _buildDetailItem(
            'Price Range',
            '₹${result.lowerEstimate.toStringAsFixed(2)} L',
            '₹${result.upperEstimate.toStringAsFixed(2)} L',
            Icons.show_chart,
            Colors.blue,
          )),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String title, String value1, String value2,
      IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            value2,
            style: TextStyle(
              fontSize: 13,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSummary() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('${input.year}', Icons.calendar_today),
              _buildChip('${input.kmsDriven} km', Icons.speed),
              _buildChip(input.fuelType, Icons.local_gas_station),
              _buildChip(input.transmission, Icons.settings),
              _buildChip('${input.owner} Owner', Icons.person),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 16, color: AppTheme.primary),
      label: Text(label),
      backgroundColor: Colors.grey.shade100,
      labelStyle: TextStyle(fontSize: 13),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: Colors.grey.shade200);
  }
}
import 'package:flutter/material.dart';
import '../models/car_input.dart';
import '../services/api_service.dart';
import '../models/prediction_response.dart';
import '../widgets/car_input_form.dart';
import '../widgets/prediction_result_card.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PredictionResponse? result;
  bool loading = false;
  CarInput? currentInput;

  Future<void> predict(CarInput car) async {
    setState(() {
      loading = true;
      currentInput = car;
    });

    try {
      final response = await ApiService.predict(car);
      setState(() => result = response);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            title: const Text(
              'Car Price Predictor',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CarInputForm(
                    onPredict: predict,
                    loading: loading,
                  ),
                  if (loading) ...[
                    const SizedBox(height: 40),
                    const CircularProgressIndicator(),
                  ],
                  if (result != null && !loading) ...[
                    const SizedBox(height: 24),
                    PredictionResultCard(
                      result: result!,
                      input: currentInput!,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
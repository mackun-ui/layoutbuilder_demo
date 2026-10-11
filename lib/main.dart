import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final List<String> products = const [
    'Bread', 'Milk', 'Eggs',
    'Rice', 'Tomatoes', 'Cooking Oil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grocery Store')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          return Column(
            children: [

              Container(
                width: double.infinity,
                color: Colors.amber.shade100,
                padding: const EdgeInsets.all(12),
                child: Text(
                  'maxWidth: ${constraints.maxWidth.toStringAsFixed(0)}  |  '
                  'maxHeight: ${constraints.maxHeight.toStringAsFixed(0)}\n'
                  'Layout: ${isWide ? "GRID" : "LIST"}',
                  textAlign: TextAlign.center,
                ),
              ),

              Expanded(
                child: isWide
                  ? GridView.count(
                      crossAxisCount: 3,
                      children:
                        products.map((p) => ProductCard(name: p)).toList(),
                    )
                  : ListView(
                      children:
                        products.map((p) => ProductCard(name: p)).toList(),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  const ProductCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(name, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
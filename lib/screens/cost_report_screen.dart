import 'package:flutter/material.dart';
import 'package:inventory/theme/app_theme.dart';

class CostReportScreen extends StatefulWidget {
  const CostReportScreen({super.key});

  @override
  State<CostReportScreen> createState() => _CostReportScreenState();
}

class _CostReportScreenState extends State<CostReportScreen> {
  final List<Map<String, dynamic>> _usageLogs = [
    {
      'id': '1',
      'materialName': 'Steel Sheet',
      'quantity': 10.0,
      'unitType': 'kg',
      'unitCost': 25.50,
      'totalCost': 255.0,
      'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      'operatorName': 'John Doe',
    },
    {
      'id': '2',
      'materialName': 'Aluminum Bar',
      'quantity': 5.0,
      'unitType': 'm',
      'unitCost': 15.75,
      'totalCost': 78.75,
      'timestamp': DateTime.now().subtract(const Duration(days: 2)),
      'operatorName': 'Jane Smith',
    },
    // Add more sample logs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Cost Report'),
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search logs...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      // TODO: Implement search
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Show date range picker
                  },
                  icon: const Icon(Icons.date_range),
                  label: const Text('Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _usageLogs.length,
              itemBuilder: (context, index) {
                final log = _usageLogs[index];
                return Card(
                  color: AppTheme.surfaceColor,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      log['materialName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity: ${log['quantity']} ${log['unitType']}',
                        ),
                        Text(
                          'Operator: ${log['operatorName']}',
                        ),
                        Text(
                          'Date: ${_formatDate(log['timestamp'])}',
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${log['totalCost']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        Text(
                          '@ \$${log['unitCost']}/${log['unitType']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: AppTheme.surfaceColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Cost:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${_calculateTotalCost()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  double _calculateTotalCost() {
    return _usageLogs.fold(
      0.0,
      (sum, log) => sum + log['totalCost'],
    );
  }
} 
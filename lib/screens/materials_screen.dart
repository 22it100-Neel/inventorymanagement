import 'package:flutter/material.dart';
import 'package:inventory/theme/app_theme.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  final List<Map<String, dynamic>> _materials = [
    {
      'id': '1',
      'name': 'Steel Sheet',
      'unitCost': 25.50,
      'stock': 100.0,
      'unitType': 'kg',
    },
    {
      'id': '2',
      'name': 'Aluminum Bar',
      'unitCost': 15.75,
      'stock': 50.0,
      'unitType': 'm',
    },
    // Add more sample materials
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Materials'),
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
                      hintText: 'Search materials...',
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
                    _showAddMaterialDialog();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _materials.length,
              itemBuilder: (context, index) {
                final material = _materials[index];
                return Card(
                  color: AppTheme.surfaceColor,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      material['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Stock: ${material['stock']} ${material['unitType']}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${material['unitCost']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditMaterialDialog(material);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(material);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMaterialDialog() {
    final nameController = TextEditingController();
    final unitCostController = TextEditingController();
    final stockController = TextEditingController();
    final unitTypeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Material'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Material Name',
              ),
            ),
            TextField(
              controller: unitCostController,
              decoration: const InputDecoration(
                labelText: 'Unit Cost',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stockController,
              decoration: const InputDecoration(
                labelText: 'Stock',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: unitTypeController,
              decoration: const InputDecoration(
                labelText: 'Unit Type (kg, m, etc.)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Add material to list
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditMaterialDialog(Map<String, dynamic> material) {
    final nameController = TextEditingController(text: material['name']);
    final unitCostController = TextEditingController(
      text: material['unitCost'].toString(),
    );
    final stockController = TextEditingController(
      text: material['stock'].toString(),
    );
    final unitTypeController = TextEditingController(text: material['unitType']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Material'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Material Name',
              ),
            ),
            TextField(
              controller: unitCostController,
              decoration: const InputDecoration(
                labelText: 'Unit Cost',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stockController,
              decoration: const InputDecoration(
                labelText: 'Stock',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: unitTypeController,
              decoration: const InputDecoration(
                labelText: 'Unit Type (kg, m, etc.)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Update material in list
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(Map<String, dynamic> material) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Material'),
        content: Text(
          'Are you sure you want to delete ${material['name']}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Delete material from list
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
} 
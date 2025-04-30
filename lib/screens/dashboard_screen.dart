import 'package:flutter/material.dart';
import 'package:inventory/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  final bool isAdmin;

  const DashboardScreen({
    super.key,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppTheme.surfaceColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout
            },
          ),
        ],
      ),
      body: isAdmin ? _buildAdminDashboard() : _buildOperatorDashboard(),
    );
  }

  Widget _buildAdminDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Stats',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatCard(
                'Total Materials',
                '25',
                Icons.inventory,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Low Stock Alerts',
                '3',
                Icons.warning,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildActionCard(
                  'Materials',
                  Icons.inventory,
                  () {
                    // TODO: Navigate to materials screen
                  },
                ),
                _buildActionCard(
                  'Users',
                  Icons.people,
                  () {
                    // TODO: Navigate to users screen
                  },
                ),
                _buildActionCard(
                  'Reports',
                  Icons.assessment,
                  () {
                    // TODO: Navigate to reports screen
                  },
                ),
                _buildActionCard(
                  'Settings',
                  Icons.settings,
                  () {
                    // TODO: Navigate to settings screen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOperatorDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Assigned Tasks',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // TODO: Replace with actual tasks
              itemBuilder: (context, index) {
                return Card(
                  color: AppTheme.surfaceColor,
                  child: ListTile(
                    leading: const Icon(Icons.task, color: AppTheme.primaryColor),
                    title: Text('Task ${index + 1}'),
                    subtitle: const Text('Description of the task'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to task details
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to scan screen
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan Material'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        color: AppTheme.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppTheme.primaryColor),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      color: AppTheme.surfaceColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: AppTheme.primaryColor),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
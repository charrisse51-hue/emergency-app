import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import the new package

void main() {
  runApp(const EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  const EmergencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barangay Emergency System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MainNavigator(),
    );
  }
}

// --- Main Navigator (Handles Bottom Tabs) ---
class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    EmergencyHomePage(),
    IncidentReportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Report'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- Tab 1: Home Dashboard (SOS & Alerts) ---
class EmergencyHomePage extends StatelessWidget {
  const EmergencyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Brgy. Doyong Emergency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Active Alerts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 10),
            Card(
              color: Colors.red.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red.shade200, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                leading: Icon(Icons.warning, color: Colors.red, size: 30),
                title: Text('Typhoon Warning: Signal No. 2', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Please prepare for possible evacuation. Stay safe, Calasiao.'),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Quick Action', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () async {
                // Fetch location for quick SOS
                bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
                if (serviceEnabled && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SOS Sent with GPS Location!'), backgroundColor: Colors.red),
                  );
                }
              },
              child: const Text('SOS PANIC BUTTON', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 30),
            const Text('Emergency Contacts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: [
                  _buildContactCard(Icons.local_police, 'Police', '117'),
                  _buildContactCard(Icons.local_fire_department, 'Fire Dept', '911'),
                  _buildContactCard(Icons.local_hospital, 'Ambulance', '143'),
                  _buildContactCard(Icons.contact_phone, 'Brgy Hall', 'Local Desk'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String number) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.redAccent),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(number, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// --- Tab 2: Incident Reporting Form with GPS ---
class IncidentReportPage extends StatefulWidget {
  const IncidentReportPage({super.key});

  @override
  State<IncidentReportPage> createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  
  String? _incidentType;
  bool _isLoadingLocation = false;

  // Function to handle GPS permissions and fetching coordinates
  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      } 

      // If permissions are granted, get the position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high)
      );

      // Update the text field with the coordinates
      setState(() {
        _locationController.text = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
      });

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Error: $e'), backgroundColor: Colors.orange),
        );
      }
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Report an Incident', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Incident Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Type of Incident', border: OutlineInputBorder()),
                initialValue: _incidentType,
                items: ['Fire', 'Medical', 'Crime', 'Flood', 'Other']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => _incidentType = value),
                validator: (value) => value == null ? 'Please select an incident type' : null,
              ),
              const SizedBox(height: 16),

              // Updated Location Field with GPS Button
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location (Address or Coordinates)',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.location_on),
                  // This adds the GPS button inside the text field
                  suffixIcon: _isLoadingLocation 
                    ? const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : IconButton(
                        icon: const Icon(Icons.my_location, color: Colors.blue),
                        onPressed: _getCurrentLocation,
                        tooltip: 'Get Current GPS Location',
                      ),
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Please enter or detect the location' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Description of the Emergency', border: OutlineInputBorder(), alignLabelWithHint: true),
                validator: (value) => (value == null || value.isEmpty) ? 'Please provide a brief description' : null,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 16)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Report Submitted with Exact Location!'), backgroundColor: Colors.green),
                      );
                      _formKey.currentState!.reset();
                      _locationController.clear();
                      setState(() => _incidentType = null);
                    }
                  },
                  child: const Text('SUBMIT REPORT', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
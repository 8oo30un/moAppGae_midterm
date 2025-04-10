import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // 필터 옵션들
  final Map<String, bool> filters = {
    'No Kids Zone': false,
    'Pet-Friendly': false,
    'Free breakfast': false,
  };

  // 날짜
  DateTime? checkInDate;

  // ExpansionPanel 상태
  bool filterExpanded = false;
  bool dateExpanded = false;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != checkInDate) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked; // 선택된 날짜를 checkInDate에 저장
        }
      });
    }
  }

  void _showSummaryDialog() {
    String selectedFilters = filters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join('/ ');

    // 다이얼로그를 띄우기 전에 checkInDate가 최신값인지 확인
    String checkInDateString = checkInDate != null
        ? checkInDate!.toString().split(' ')[0]
        : 'Not selected';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: const Text(
            'Please check your choice :)',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.filter_list, color: Colors.blue),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    selectedFilters.isNotEmpty ? selectedFilters : "None",
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'IN   $checkInDateString',
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Search'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Search'),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                if (index == 0) {
                  filterExpanded = !filterExpanded;
                } else if (index == 1) {
                  dateExpanded = !dateExpanded;
                }
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) => const ListTile(
                  title: Text('Filters'),
                ),
                body: Column(
                  children: filters.keys.map((key) {
                    return Center(
                      child: SizedBox(
                        width: 250,
                        child: CheckboxListTile(
                          value: filters[key],
                          onChanged: (value) {
                            setState(() {
                              filters[key] = value ?? false;
                            });
                          },
                          activeColor: Colors.blue,
                          title: Text(
                            key,
                            style: const TextStyle(fontSize: 16),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                isExpanded: filterExpanded,
              ),
              ExpansionPanel(
                headerBuilder: (context, isExpanded) => const ListTile(
                  title: Text('Dates'),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Check-in Date'),
                        subtitle: Text(checkInDate != null
                            ? checkInDate.toString().split(' ')[0]
                            : 'Not selected'),
                        trailing: const Icon(Icons.calendar_today),
                        onTap: () => _selectDate(context, true),
                      ),
                    ],
                  ),
                ),
                isExpanded: dateExpanded,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _showSummaryDialog,
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}

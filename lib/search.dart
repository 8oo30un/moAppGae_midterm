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
  DateTime? checkOutDate;

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
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });
    }
  }

  void _showSummaryDialog() {
    String selectedFilters = filters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(', ');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Please check your choice :)',
          style: TextStyle(color: Colors.white),
        ),
        titlePadding: EdgeInsets.all(16.0),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        backgroundColor: Colors.blue, // 파란색 배경
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters: ${selectedFilters.isNotEmpty ? selectedFilters : "None"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Check-in: ${checkInDate != null ? checkInDate.toString().split(' ')[0] : "Not selected"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Check-out: ${checkOutDate != null ? checkOutDate.toString().split(' ')[0] : "Not selected"}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  // Search 버튼 클릭 시 추가 동작
                  Navigator.of(context).pop();
                },
                child: const Text('Search'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
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
                      // 중앙 정렬
                      child: SizedBox(
                        width: 250, // 고정 너비를 지정해서 수직 정렬 맞춤
                        child: CheckboxListTile(
                          value: filters[key],
                          onChanged: (value) {
                            setState(() {
                              filters[key] = value ?? false;
                            });
                          },
                          activeColor: Colors.blue, // 파란색 체크
                          title: Text(
                            key,
                            style: const TextStyle(fontSize: 16),
                          ),
                          controlAffinity:
                              ListTileControlAffinity.leading, // 체크박스를 텍스트 왼쪽에
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0), // 여백 제거
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
                      ListTile(
                        title: const Text('Check-out Date'),
                        subtitle: Text(checkOutDate != null
                            ? checkOutDate.toString().split(' ')[0]
                            : 'Not selected'),
                        trailing: const Icon(Icons.calendar_today),
                        onTap: () => _selectDate(context, false),
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

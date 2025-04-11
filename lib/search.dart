import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<bool> _filterValues = [false, false, false];
  late List<bool> _isExpand;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _isExpand = List<bool>.filled(1, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _isExpand[index] = !_isExpand[index];
                  });
                },
                children: [
                  ExpansionPanel(
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Row(
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 90),
                            Text(
                              'Select filters',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    },
                    body: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // 세로 방향 중앙 정렬
                        children: [
                          SizedBox(
                            width: 220, // 원하는 너비로 제한
                            child: CheckboxListTile(
                              controlAffinity:
                                  ListTileControlAffinity.leading, // 체크박스 왼쪽
                              title: const Align(
                                alignment: Alignment.center, // 텍스트 가운데 정렬
                                child: Text('No Kids Zone'),
                              ),
                              value: _filterValues[0],
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterValues[0] = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Align(
                                alignment: Alignment.center,
                                child: Text('Pet-Friendly'),
                              ),
                              value: _filterValues[1],
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterValues[1] = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Align(
                                alignment: Alignment.center,
                                child: Text('Free breakfast'),
                              ),
                              value: _filterValues[2],
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterValues[2] = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _isExpand[0],
                    canTapOnHeader: true,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Text(
                      'Date',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(width: 8),
                                  Text('Check-in'),
                                ],
                              ),
                              Text(
                                _selectedDate == null
                                    ? 'Choose a date'
                                    : ' ${DateFormat.yMMMd().format(_selectedDate!)}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              ).then((selectedDate) {
                                setState(() {
                                  _selectedDate = selectedDate;
                                });
                              });
                            },
                            child: const Text(
                              'Select Date',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 25),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 200, 100, 10),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      List<String> selectedOptions = [];
                      if (_filterValues[0]) {
                        selectedOptions.add('No Kids Zone');
                      }
                      if (_filterValues[1]) {
                        selectedOptions.add('Pet-Friendly');
                      }
                      if (_filterValues[2]) {
                        selectedOptions.add('Free breakfast');
                      }
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        content: SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 90,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Please check\nyour choices:)',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            3, 1, 3, 0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(Icons.filter_list,
                                                  color: Colors.blue),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 5, 5),
                                              child: Text(
                                                selectedOptions.join('/'),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            3.0, 10, 3, 0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(Icons.calendar_month,
                                                  color: Colors.blue),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'IN',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            if (_selectedDate != null)
                                              Text(
                                                DateFormat.yMMMMEEEEd()
                                                    .format(_selectedDate!),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(22.5, 8, 20, 8),
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(100, 30),
                                      backgroundColor: Colors.blue,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 22.5, 8),
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(100, 30),
                                      backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

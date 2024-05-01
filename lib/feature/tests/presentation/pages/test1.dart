import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:data_table_2/data_table_2.dart';

import '../../data/models/base/base.dart';
import '../provider/base_config_provider.dart';

class Test1Screen extends ConsumerStatefulWidget {
  const Test1Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Test1ScreenState();
}

class _Test1ScreenState extends ConsumerState<Test1Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool selected = true;
  String? portTypeValue = 'GigabitEthernet';
  String? typeValue = 'Basic';
  bool isAP = false;
  Color? apColor = Colors.grey[50];
  Color? basicColor;

  TextEditingController interfaceRangeController = TextEditingController();
  TextEditingController pvidController = TextEditingController();
  TextEditingController allowVidController = TextEditingController();
  TextEditingController portVlanIDController = TextEditingController();

  late CommonInterface commonInterfaces;
  List<ApPort> apPorts = [];
  List<BasePort> basePorts = [];
  late CommonPort commonPort;

  final List<Map<String, dynamic>> _dataList = [];

  // clear form content after Add
  void _clearForm() {
    interfaceRangeController.clear();
    pvidController.clear();
    allowVidController.clear();
    portVlanIDController.clear();
  }

  // Add button submit table data
  void _submitTableData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _dataList.add({
          'type': typeValue,
          'portType': portTypeValue,
          'interface': interfaceRangeController.text,
          'portVlanId': portVlanIDController.text,
          'allowVid': allowVidController.text,
          'pvid': pvidController.text,
        });
        _clearForm();
      });
    }
  }

  // Delete row by delete button
  void _deleteRowData(int index) {
    setState(() {
      _dataList.removeAt(index);
    });
  }

  // Reset all Form Data
  void _resetAll() {
    setState(() {
      _dataList.clear();
    });
  }

  void _addCommonPort(Map<String, dynamic> item) {
    commonPort = (CommonPort(
      portType: item['portType'],
      portRange: item['interface'],
    ));
  }

  void _addApPort(Map<String, dynamic> item) {
    apPorts.add(ApPort(
      pvid: item['pvid'],
      allowVid: item['allowVid'],
      commonPort: commonPort,
    ));
  }

  void _addBasePort(Map<String, dynamic> item) {
    basePorts.add(
      BasePort(
        commonPort: commonPort,
        portVlanId: item['portVlanId'],
      ),
    );
  }

  void _addCommonInterface() {
    commonInterfaces = (CommonInterface(
      apPort: apPorts,
      basePort: basePorts,
    ));
  }

  void setCommonInterfaces(List<Map<String, dynamic>> dataList) {
    apPorts.clear();
    basePorts.clear();
    if (dataList.isNotEmpty) {
      for (var item in dataList) {
        _addCommonPort(item);
        if (item['type'] == 'Basic') {
          _addBasePort(item);
        } else {
          _addApPort(item);
        }
      }
      _addCommonInterface();
      debugPrint(commonInterfaces.toString());
    }
  }

  void _changeTextColor() {
    setState(() {
      apColor = isAP ? null : Colors.grey[50];
      basicColor = isAP ? Colors.grey[50] : null;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    interfaceRangeController.dispose();
    pvidController.dispose();
    allowVidController.dispose();
    portVlanIDController.dispose();

    super.dispose();
  }

  // static const questionMark = Padding(
  //   padding: EdgeInsetsDirectional.only(start: 4.0),
  //   child: Icon(FluentIcons.status_circle_question_mark, size: 14.0),
  // );

  // InlineSpan _buildLabel(String label, String description) {
  //   return TextSpan(
  //     text: label,
  //     children: [
  //       WidgetSpan(
  //         child: Tooltip(
  //           useMousePosition: false,
  //           message: description,
  //           child: questionMark,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final repsonseAsync = ref.watch(receiveDataProvider);
      final sentData = ref.watch(sentDataProvider.notifier);
      return ScaffoldPage.scrollable(
        header: const PageHeader(
          title: Text('Test1'),
        ),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  spacing: 10,
                  children: [
                    // InfoLabel.rich(
                    //   label: const TextSpan(
                    //       text: 'test test2', style: TextStyle(wordSpacing: 4)),
                    //   child: Container(
                    //     margin: const EdgeInsets.only(top: 8),
                    //     width: 100,
                    //     child: const TextBox(
                    //       placeholder: 'test',
                    //     ),
                    //   ),
                    // ),
                    InfoLabel(
                      label: 'Type',
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 120,
                        child: ComboBox<String>(
                            value: typeValue,
                            items: ['Basic', 'AP']
                                .map((e) => ComboBoxItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            isExpanded: true,
                            onChanged: (v) {
                              setState(() {
                                typeValue = v;
                                isAP = v == 'AP';
                              });
                              _changeTextColor();
                            }),
                      ),
                    ),
                    InfoLabel(
                      label: 'Interface',
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 200,
                        child: ComboBox<String>(
                          value: portTypeValue,
                          items: ['GigabitEthernet', 'XGigabitEthernet']
                              .map((e) => ComboBoxItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          isExpanded: true,
                          onChanged: (v) => setState(() => portTypeValue = v),
                        ),
                      ),
                    ),
                    InfoLabel(
                      label: 'Interface Range',
                      child: SizedBox(
                          width: 200,
                          child: TextFormBox(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: interfaceRangeController,
                              onChanged: (value) => setState(() {
                                    interfaceRangeController.text = value;
                                  }))),
                    ),
                    InfoLabel(
                      label: 'Vlan ID',
                      child: SizedBox(
                          width: 100,
                          child: TextBox(
                            controller: portVlanIDController,
                            enabled: !isAP,
                            decoration: BoxDecoration(color: basicColor),
                          )),
                    ),
                    InfoLabel(
                      label: 'Allow Vlan',
                      child: SizedBox(
                          width: 100,
                          child: TextBox(
                            controller: allowVidController,
                            enabled: isAP,
                            decoration: BoxDecoration(color: apColor),
                          )),
                    ),
                    InfoLabel(
                      label: 'PVID',
                      child: SizedBox(
                          width: 100,
                          child: TextBox(
                            controller: pvidController,
                            enabled: isAP,
                            decoration: BoxDecoration(color: apColor),
                          )),
                    ),
                    InfoLabel(
                      label: 'Add',
                      child: FilledButton(
                          child: const Text('ADD'),
                          onPressed: () {
                            _submitTableData();
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Card(
            child: m.Material(
                child: SizedBox(
              height: 400,
              child: m.Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: buildColumns,
                    rows: buidRows(_dataList),
                    empty: Center(
                        child: Container(
                      width: 600,
                      height: 80,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'No data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    )),
                  )),
            )),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton(
                  child: const Text('Reset All'),
                  onPressed: () {
                    _resetAll();
                  },
                ),
                FilledButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    setCommonInterfaces(_dataList);
                    sentData.state = commonInterfaces;
                    debugPrint(sentData.state.toString());
                  },
                ),
              ],
            ),
          ),
          Card(
            // child: SizedBox(height: 100, child: Text('base interface config')
            child: repsonseAsync.when(
              data: (data) => Text(data.data.toString()),
              error: (e, _) => Text(e.toString()),
              loading: () => const Center(child: ProgressBar()),
            ),
          ),
          // ),
        ],
      );
    });
  }

  List<m.DataColumn> get buildColumns {
    return const [
      DataColumn2(label: Text('Type'), size: ColumnSize.L),
      DataColumn2(label: Text('Interface'), size: ColumnSize.L),
      DataColumn2(label: Text('Interface Range'), size: ColumnSize.L),
      DataColumn2(label: Text('Vlan ID'), size: ColumnSize.L),
      DataColumn2(label: Text('Allow Vlan'), size: ColumnSize.L),
      DataColumn2(label: Text('PVID'), size: ColumnSize.L),
      DataColumn2(label: Text('Delete'), size: ColumnSize.L),
    ];
  }

  List<DataRow2> buidRows(List dataList) {
    return dataList.map((e) {
      return DataRow2(cells: [
        m.DataCell(Text(e['type'])),
        m.DataCell(Text(e['portType'])),
        m.DataCell(Text(e['interface'])),
        m.DataCell(Text(e['portVlanId'])),
        m.DataCell(Text(e['allowVid'])),
        m.DataCell(Text(e['pvid'])),
        m.DataCell(IconButton(
            icon: const Icon(FluentIcons.delete),
            onPressed: () {
              _deleteRowData(dataList.indexOf(e));
            })),
      ]);
    }).toList();
  }
}

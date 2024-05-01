import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' as m;
import 'package:testform/feature/tests/presentation/provider/init_config_provider.dart';

import '../../domain/entities/init_entity.dart';

class Test2Page extends ConsumerStatefulWidget {
  const Test2Page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Test2PageState();
}

class _Test2PageState extends ConsumerState<Test2Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _dataList = [];
  InitEntity? initEntity;

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _dataList.add({
          'username': _usernameController.text,
          'password': _passwordController.text,
          'hostname': _hostnameController.text,
        });
        _clearFrom();
      });
    }
  }

  void _addInitEntity(Map<String, dynamic> item) {
    initEntity = InitEntity(
      hostname: item['hostname'],
      password: item['password'],
      username: item['username'],
    );
  }

  void _deleteData(int index) {
    setState(() {
      _dataList.removeAt(index);
    });
  }

  void _clearFrom() {
    _usernameController.clear();
    _passwordController.clear();
    _hostnameController.clear();
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hostnameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _hostnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responseAsync = ref.watch(initConfigProviderProvider);
    return ScaffoldPage.scrollable(
        header: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'test2',
            style: TextStyle(fontSize: 24),
          ),
        ),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InfoLabel(
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    label: 'Username',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: TextBox(
                        controller: _usernameController,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InfoLabel(
                    labelStyle: const TextStyle(fontSize: 18),
                    label: 'Password',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: TextFormBox(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InfoLabel(
                    labelStyle: const TextStyle(fontSize: 18),
                    label: 'Hostname',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: TextFormBox(
                          controller: _hostnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an age';
                            }
                            return null;
                          }),
                    ),
                  ),
                ),
                FilledButton(
                  style: ButtonStyle(iconSize: ButtonState.all(16)),
                  onPressed: _dataList.isNotEmpty ? null : _submitData,
                  child: const Text('ADD'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          m.DataTable(
            columns: const [
              m.DataColumn(
                label: Text('Username'),
              ),
              m.DataColumn(
                label: Text('Password'),
              ),
              m.DataColumn(
                label: Text('Hostname'),
              ),
              m.DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: _dataList.map((e) {
              return m.DataRow(cells: [
                m.DataCell(Text(e['username'])),
                m.DataCell(Text(e['password'])),
                m.DataCell(Text(e['hostname'])),
                m.DataCell(Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.edit),
                    // ),
                    IconButton(
                      onPressed: () {
                        _deleteData(_dataList.indexOf(e));
                      },
                      icon: const Icon(FluentIcons.delete),
                    ),
                  ],
                ))
              ]);
            }).toList(),
          ),
          FilledButton(
            style: ButtonStyle(iconSize: ButtonState.all(16)),
            onPressed: () {
              _addInitEntity(_dataList.first);
              debugPrint(initEntity!.hostname);
              debugPrint(initEntity!.password);
              debugPrint(initEntity!.username);
              ref
                  .read(initConfigProviderProvider.notifier)
                  .fetchInitConfig(initEntity!);
            },
            child: const Text('Submit'),
          ),
          Card(
            child: responseAsync.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: ProgressBar()),
            ),
          ),
        ]);
  }
}

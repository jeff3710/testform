import 'package:fluent_ui/fluent_ui.dart';
import 'package:ipaddr/ipaddr.dart' as ipaddr;

import '../../../tests/presentation/widgets/page.dart';

class SubnetCalcPage extends StatefulWidget {
  const SubnetCalcPage({super.key});

  @override
  State<SubnetCalcPage> createState() => _SubnetCalcPageState();
}

class _SubnetCalcPageState extends State<SubnetCalcPage> with PageMixin {
  bool disabled = false;
  double firstValue = 23.0;
  double verticalValue = 50.0;
  final TextEditingController _controller = TextEditingController();

  var network = ipaddr.IPv4Network('192.168.1.0/24');

  // void initial() {
  //   setState(() {
  //     network;
  //   });
  // }

  // void _subnetCalc(TextEditingController controller) {
  //   network = ipaddr.IPv4Network(_controller.text);
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: const Text('Exemple'),
        commandBar: ToggleSwitch(
          checked: disabled,
          onChanged: (v) => setState(() => disabled = v),
          content: const Text('Disabled'),
        ),
      ),
      children: [
        const Text('Exemple'),
        Center(
          widthFactor: 100,
          child: SizedBox(
            width: 400,
            child: TextFormBox(
              controller: _controller,
              placeholder: 'please enter a address and mask',
              onChanged: (v) {
                setState(() {});
              },
            ),
          ),
        ),
        Center(
          child: FilledButton(
            child: const Text('Submit'),
            onPressed: () {
              setState(() {
                network = ipaddr.IPv4Network(_controller.text);
                ;
              });
            },
          ),
        ),
        Center(
          child: Column(
            children: [
              Text('network is $network'),
              Text(network.networkAddress.toString()),
              Text(network.broadcastAddress.toString()),
              Text(network.prefixlen.toString()),
              Text(network.netmask.toString()),
              Text('${network.hosts.first}-${network.hosts.last}'),
              Text(network.addresses.first.toString()),
              Text((network.numAddresses - 2).toString()),
              Text(network.withPrefixlen.toString()),
              Text(network.withHostmask.toString()),
              Text(network.withNetmask.toString()),
            ],
          ),
        )
      ],
    );
  }
}

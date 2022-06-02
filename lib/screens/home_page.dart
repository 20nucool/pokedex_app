import 'package:flutter/material.dart';
import 'package:poke_app/services/remote_services.dart';
import 'package:poke_app/widgets/container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? poke;
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    print('check');
    poke = await RemoteServices().getPoke();
    if (poke != null) {
      print('set');
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          title: const Text('Pokedex'),
        ),
        body: Visibility(
          visible: isLoaded,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3/2,
                  ),
              itemCount: poke?.length,
              itemBuilder: (BuildContext context, index) {
                return ContainerWidget(poke: poke?[index]);
              }),
          replacement: const Center(child: CircularProgressIndicator()),
        ));
  }
}

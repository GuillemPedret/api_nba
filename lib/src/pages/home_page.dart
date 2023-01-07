import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:api_to_sqlite/src/providers/players_api_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Best NBA players', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              icon: const Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 2.0,
              opacity: 0.2,
              image: AssetImage(
                  'assets/images/NBA-logo.png'),
            ),
          ),
        child: Container(
          child:
            _buildPlayersListView(),

        )
      )
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = PlayersApiProvider();
    await apiProvider.getAllPlayers();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllPlayers();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

  }

  _buildPlayersListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllPlayers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: (snapshot.data.length),
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                return Container (
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.redAccent, width: 1.0)),
                    color: Colors.transparent,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    title: Text("${snapshot.data[index].name}", style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),),
                    subtitle: Text('${snapshot.data[index].team}', style: const TextStyle(fontWeight: FontWeight.bold),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0)),
                  ),
                );
              }
          );
      },
    );
  }
}

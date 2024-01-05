import 'package:flutter/material.dart';
import 'package:betmaster/screens/register/register_screen.dart';
import 'package:betmaster/screens/login/login_screen.dart';
import 'package:betmaster/widgets/navbar_games.dart';
import 'package:betmaster/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService(); // Utiliza a classe de serviço para fazer requisições à API
  List<dynamic> gamesData = []; // Armazena os dados dos jogos

  @override
  void initState() {
    super.initState();
    fetchGamesData(); // Inicia a busca dos dados quando a tela é criada
  }

  Future<void> fetchGamesData() async {
    try {
      final result = await apiService.request('/api/games', method: 'GET');
      setState(() {
        gamesData = result['data']; 
      });
    } catch (e) {
      print('Failed to fetch games data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF444A73),
      body: Padding(
        padding: EdgeInsets.only(top: 77.0),
        child: Column(
          children: [
            NavigationBarGames(),
            SizedBox(
              height: 20.0,
            ), 
            // Widget dinâmico
            buildDynamicBox(),
          ],
        ),
      ),
    );
  }

  Widget buildDynamicBox() {
    return gamesData.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: gamesData.length,
              itemBuilder: (context, index) {
                final game = gamesData[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffff3058), width: 5.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Image.network(
                        game['logoUrl'],
                        width: 50.0,
                        height: 50.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        game['name'],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteServices {
  Future<List?> getPoke() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['pokemon'];
    }
    return null;
  }
}

import 'dart:convert';

import 'package:api/dados.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  final String baseUrl =  "https://dragonball-api.com/api/characters";

  //Get

  Future<List<Dados>> getDados()async{
    final response = await http.get(Uri.parse(baseUrl));
      
    if(response.statusCode == 200){
    final decoded = jsonDecode(response.body);

      List<dynamic> body = decoded["items"];
      return body.map((dynamic item) {
        return Dados.fromMap(item);
      }).toList();
    }
    return [];
  }
  //Post

  Future<Dados?> createDados(Dados dados) async{
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(dados.toMap()),
      );
      if(response.statusCode == 201){
        print("Dado Inserido");
        return Dados.fromMap(jsonDecode(response.body));
      }
      return null;
  }
  //Put

  Future<Dados?> updateDados(Dados dados, int id) async{
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(dados.toMap()),
      );
      if(response.statusCode == 200){
        print("Dado Inserido");
        return Dados.fromMap(jsonDecode(response.body));
      }
      return null;
  }
  //Delete

  Future<void> deleteDados(int id)async{
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode == 200){
      print("Dado deletado com sucesso");
    }
  }
}
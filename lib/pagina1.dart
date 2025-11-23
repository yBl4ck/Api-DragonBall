import 'package:api/apiService.dart';
import 'package:api/dados.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  List<Dados> dados = [];
  Apiservice apiservice = Apiservice();

  void loadDados() async{
    var list = await apiservice.getDados();
    setState(() {
      dados = list;
    });
  }
  @override
  void initState() {
    loadDados();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(itemCount: dados.length,
      itemBuilder: (ctx,index){
        return ListTile(
          title: Center(child: Text("Nombre: "+ dados[index].name)),
          subtitle: Column(
            children: [
              Text("Raza: "+ dados[index].race),
              Text("Nivel de Ki: "+dados[index].ki.toString()),
              SizedBox(
                height: 40,
              ),
              Image.network(dados[index].imageUrl,
              height: 200,
              )
            ],
          ),
        );
      }
      ),
    );
  }
}
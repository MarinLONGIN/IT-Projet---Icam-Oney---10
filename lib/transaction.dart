
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';


class AjouterUnRevenu extends StatelessWidget{
  final AccountBalanceState accountBalance = AccountBalanceState();
  final TextEditingController _controller = TextEditingController();

  AjouterUnRevenu({super.key});
   @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un revenu"),
        elevation: 0.0,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            TextFormField(
              controller: _controller,
              onChanged: (_) {
                int income = int.parse(_controller.text);
                accountBalance.add(income);
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
          ],
        ),
      ),
    );
   }
}


class AjouterUneDepense extends StatelessWidget{
  const AjouterUneDepense({super.key});
  
  get _controller => null;

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une dépense"),
        elevation: 0.0,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
            ),
          ],
        ),
      ),
    );
   }
}



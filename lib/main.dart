import 'package:flutter/material.dart';
import 'package:flutter_application_1/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transaction.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icamoney',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccountBalance(),
            const TransactionList(),
          ],
        ),
      ),

      floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
      floatingActionButton: Wrap(
        direction: Axis.horizontal, 
        children: <Widget>[
          Container(
            margin:const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: (){Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const AjouterUneDepense(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var tween = Tween(begin: begin, end: end);
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      ); 
                      },
                    )
              );
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ), 

          Container( 
            margin:const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: (){Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => AjouterUnRevenu(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var tween = Tween(begin: begin, end: end);
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      ); 
                      }
                    ),
              );},
              backgroundColor: Colors.green,
              // ignore: prefer_const_constructors
              child: Icon(
            Icons.add, color: Colors.white),
            )
          ),
    ],),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.amber,
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.menu), onPressed: () {Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const Badges(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var tween = Tween(begin: begin, end: end);
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      ); 
                      }
                    ),
            );},
            ),
          ],
        ),
      ),
   );
  }
}

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  AccountBalanceState createState() => AccountBalanceState();
}

class AccountBalanceState extends State<AccountBalance> {
  int _result = 0;

  void add(int value) {
    setState(() {
      _result += value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 193, 7, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 175,
            bottom: 100,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2, 
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(10),
              child: Text('$_result€'),
            ),
          ),
          Positioned(
            left: 55,
            bottom: 200,
            child: Image.asset('assets/logo-removebg-preview.png'),
          ),
          Positioned(
            left: 65,
            bottom: 40,
            child: Text(
              'Solde du compte',
              style: GoogleFonts.merienda(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
  

}



class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.fromLTRB(30,40,20,20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dernières Transactions',
                style:GoogleFonts.merienda(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  'Toutes',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}




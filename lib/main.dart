import 'package:flutter/material.dart';
import 'package:sayi_tahmin/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  late MediaQueryData ekranBilgisi;
  late double ekranYuksekligi;
  late double ekranGenisligi;

  @override
  Widget build(BuildContext context) {
    ekranBilgisi = MediaQuery.of(context);
    ekranYuksekligi = ekranBilgisi.size.height;
    ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme!.inversePrimary,
        title: const Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Tahmin Oyununa Hoşgeldiniz",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            SizedBox(
                height: ekranYuksekligi/10,
                child: Image.asset("resimler/dice.png")
            ),
            SizedBox(
              height: ekranYuksekligi/10,
              width: ekranGenisligi/2,
              child: ElevatedButton(
                onPressed: () {
                  print("Oyuna Başla");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Butonun arka plan rengi
                ),
                child: Text("Oyuna Başla",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}

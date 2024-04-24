import 'package:flutter/material.dart';
import 'package:sayi_tahmin/main.dart';

class SonucEkrani extends StatefulWidget {

  late bool sonuc;
  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            SizedBox(
                height: ekranYuksekligi/10,
                child: widget.sonuc ?  Image.asset("resimler/happy.png") : Image.asset("resimler/sadeFace.png")
            ),
            Text( widget.sonuc ? "Tebrikler Kazandınız!" : "Kaybettiniz !", style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            SizedBox(
              height: ekranYuksekligi/15,
              width: ekranGenisligi/2,
              child: ElevatedButton(
                onPressed: () {
                  print("Oyuna Başla");
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Butonun arka plan rengi
                ),
                child: const Text("Ana Sayfaya Dön",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
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

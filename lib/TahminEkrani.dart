import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  late MediaQueryData ekranBilgisi;
  late double ekranYuksekligi;
  late double ekranGenisligi;

  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    rasgeleSayi = Random().nextInt(101); // 0-100 arası sayı üretir.
    print("Rasgele Sayı: $rasgeleSayi");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ekranBilgisi = MediaQuery.of(context);
    ekranYuksekligi = ekranBilgisi.size.height;
    ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(color: Colors.pink, fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: tfTahmin,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Text(
              "Yardım: $yonlendirme",
              style: const TextStyle(color: Colors.green, fontSize: 25),
            ),
            SizedBox(
              height: ekranYuksekligi / 13,
              width: ekranGenisligi / 2,
              child: ElevatedButton(
                onPressed: () {
                  print("Tahmin Et");
                  int? tahmin;
                  if (tfTahmin.text.isNotEmpty) {
                    tahmin = int.tryParse(tfTahmin.text)!;

                    setState(() {
                      kalanHak = kalanHak - 1;
                    });

                    if (tahmin == rasgeleSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                sonuc: true,
                              )));
                      return;
                    }
                    if (tahmin > rasgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini Azalt";
                      });
                    }
                    if (tahmin < rasgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini Arttır";
                      });
                    }
                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(
                                sonuc: false,
                              )));
                    }
                    tfTahmin.text = "";
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Uyarı"),
                          content: Text("Tahmin alanı boş bırakılamaz!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Tamam"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text(
                  "Tahmin Et",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

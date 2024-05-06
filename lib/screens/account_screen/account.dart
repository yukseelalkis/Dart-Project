import 'package:flutter/material.dart';
import 'package:finalproject/screens/account_screen/account.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String routeName = 'AccountScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Not Hesaplama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountScreenPage(),
    );
  }
}

class AccountScreenPage extends StatefulWidget {
  @override
  _AccountScreenPage createState() => _AccountScreenPage();
}

class _AccountScreenPage extends State<AccountScreenPage> {
  TextEditingController turkceDogruController = TextEditingController();
  TextEditingController turkceYanlisController = TextEditingController();
  TextEditingController sosyalDogruController = TextEditingController();
  TextEditingController sosyalYanlisController = TextEditingController();
  TextEditingController matematikDogruController = TextEditingController();
  TextEditingController matematikYanlisController = TextEditingController();
  TextEditingController fenDogruController = TextEditingController();
  TextEditingController fenYanlisController = TextEditingController();

  int turkceNet = 0, sosyalNet = 0, matematikNet = 0, fenNet = 0;
  double tytPuan = 0, aytPuan = 0;

  void hesaplaNotlar() {
    setState(() {
      turkceNet = (int.tryParse(turkceDogruController.text) ?? 0) -
          ((int.tryParse(turkceYanlisController.text) ?? 0) ~/ 4);
      sosyalNet = (int.tryParse(sosyalDogruController.text) ?? 0) -
          ((int.tryParse(sosyalYanlisController.text) ?? 0) ~/ 4);
      matematikNet = (int.tryParse(matematikDogruController.text) ?? 0) -
          ((int.tryParse(matematikYanlisController.text) ?? 0) ~/ 4);
      fenNet = (int.tryParse(fenDogruController.text) ?? 0) -
          ((int.tryParse(fenYanlisController.text) ?? 0) ~/ 4);

      // TYT Puan Hesaplama (Örnek formül - Değiştirebilirsiniz)
      tytPuan = turkceNet * 1.33 + sosyalNet * 1.33 + matematikNet * 1.33 + fenNet * 1.33;

      // AYT Puan Hesaplama (Örnek formül - Değiştirebilirsiniz)
      aytPuan = turkceNet * 1.33 + sosyalNet * 1.33 + matematikNet * 2.66 + fenNet * 2.66;
    });
  }

  void navigateToGraphPage() {
    // Grafik sayfasına yönlendirme işlemini burada gerçekleştirebilirsiniz.
    // Örneğin:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GraphPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Not Hesaplama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            buildSubjectRow('Türkçe', turkceDogruController, turkceYanlisController, turkceNet),
            buildSubjectRow('Sosyal', sosyalDogruController, sosyalYanlisController, sosyalNet),
            buildSubjectRow('Matematik', matematikDogruController, matematikYanlisController, matematikNet),
            buildSubjectRow('Fen', fenDogruController, fenYanlisController, fenNet),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hesaplaNotlar,
              child: Text('Hesapla'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: navigateToGraphPage,
                  child: Text('Grafik'),
                ),
                Text('TYT Puan: $tytPuan'),
                Text('AYT Puan: $aytPuan'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubjectRow(
      String subject,
      TextEditingController dogruController,
      TextEditingController yanlisController,
      int net,
      ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          buildTextFieldRow('Doğru', dogruController),
          buildTextFieldRow('Yanlış', yanlisController),
          buildScoreRow('NET', net),
        ],
      ),
    );
  }

  Widget buildTextFieldRow(String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Flexible(
          child: Container(
            width: 100,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildScoreRow(String label, int score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(score.toString()),
      ],
    );
  }
}

class GraphPage extends StatelessWidget {
  final List<double> userScores = [20,17,35,17];
  final List<double> targetScores = [30,15,30,15];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(), // Kategori eksenini kullanın
          title: ChartTitle(text: 'Öğrenci ve Hedef Skorları'),
          legend: Legend(isVisible: true),
          series: <CartesianSeries>[
            // Öğrenci notlarını gösteren çubuklar
            ColumnSeries<double, String>(
              dataSource: userScores,
              xValueMapper: (double value, _) => userScores.indexOf(value).toString(),
              yValueMapper: (double value, _) => value,
              name: 'Öğrenci',
            ),
            // Hedef notlarını gösteren çubuklar
            ColumnSeries<double, String>(
              dataSource: targetScores,
              xValueMapper: (double value, _) => targetScores.indexOf(value).toString(),
              yValueMapper: (double value, _) => value,
              name: 'Hedef',
            ),
          ],
        ),
      ),
    );
  }
}
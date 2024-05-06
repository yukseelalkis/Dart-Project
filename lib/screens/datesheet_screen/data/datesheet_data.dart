class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(11, 'OCAK', 'Türkçe', 'Pazartesi', '9:00am'),
  DataSheet(12, 'OCAK', 'Biyoloji', 'Salı', '10:00am'),
  DataSheet(13, 'OCAK', 'Kimta', 'Çarşamba', '9:30am'),
  DataSheet(14, 'OCAK', 'Fizik', 'Perşembe', '11:00am'),
  DataSheet(15, 'OCAK', 'Matematik', 'Cuma', '9:00am'),
  DataSheet(16, 'OCAK', 'Geometri', 'Cuma', '11:00am'),
];

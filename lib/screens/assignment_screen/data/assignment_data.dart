class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData(
      'Biyoloji', 'Sinir Sistemi', '8 Ocak 2024', ' 14 Ocak 2024', 'Yapılmadı'),
  AssignmentData(
      'Kimya', 'Organık Kimya', '8 Ocak 2024', '14 Ocak 2024', 'Yapıldı'),
  AssignmentData('Fizik', 'Atışlar', '8 Ocak 2024', '13 Ocak 2024',
      'Yapıldı'),
  AssignmentData(
      'Matematik', 'Türev', '8 Ocak 2024', '14 Ocak 2021', 'Yapılmadı'),
];

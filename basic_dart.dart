double hitungPakan({required double berat, required int populasi, double persentase = 2.5,}){
  return berat * populasi * (persentase/100);
}

var statusList = ['PUNAH', 'CRITICAL', 'ENDANGERED', 'VULNERABLE'];
var tindakanList = ['Arsip Data', 'Penangkaran Intensif Prioritas Utama', 'Proteksi Habitat & Monitoring Ketat', 'Observasi Berkala'];
String tentukanStatus(int? populasi){
  if(populasi == null){
    return "Data populasi tidak ada!";
  }

  if(populasi == 0){
    return("Status: ${statusList[0]}\nTindakan: ${tindakanList[0]}");
  }
  else if(populasi < 50){
    return("Status: ${statusList[1]}\nTindakan: ${tindakanList[1]}");
  }
  else if(populasi <= 250){
    return("Status: ${statusList[2]}\nTindakan: ${tindakanList[2]}");
  }else{
    return("Status: ${statusList[3]}\nTindakan: ${tindakanList[3]}");
  }
}

Map<String, dynamic>? cariSpesimen(List<Map<String, dynamic>> daftar, String nama){
  for(var spesimen in daftar){
    if(spesimen['nama']?.toString().toLowerCase() == nama.toLowerCase()){
      return spesimen;
    }
  }
  return null;
}
void main(){
  print("Menghitung Pakan");
  double totalPakan = hitungPakan(berat: 1.5, populasi: 100);
  print("Total Pakan: $totalPakan kg");

  print("Status Populasi Spesimen");
  int populasi = 100;
  print(tentukanStatus(populasi));

  print("Cari Spesimen");
  List<Map<String, dynamic>> inventarisSpesimen = [
    {'nama': 'Harimau Sumatera', 'populasi': 350, 'terancam': true},
    {'nama': 'Gajah Sumatera', 'populasi': 1200, 'terancam': true},
    {'nama': 'Burung Jalak Bali', 'populasi': 45, 'terancam': true},
    {'nama': 'Ayam Hutan', 'populasi': 5000, 'terancam': false},
  ];

  var hasilCari = cariSpesimen(inventarisSpesimen, "Harimau Sumatera");
  print("Hasil ditemukan: $hasilCari");
}
import 'package:collection/collection.dart'; 
void main() {
  var tugas = Tugas();
  tugas.asc();
  tugas.desc();
  tugas.avg();
  tugas.median();
  tugas.modus();
}

class Tugas {
  List data = [3, 18, 45, 16, 2, 5, 7, 9, 10, 1, 16, 11, 4, 8, 11, 16, 32, 56];
  void asc() {
    data.sort((a, b) => a.compareTo(b));
    print("Dari kecil ke besar :");
    print(data);
  }

  void desc() {
    data.sort((a, b) => b.compareTo(a));
    print("Dari besar ke kecil :");
    print(data);
  }

  void avg() {
    num sum = 0;
    for (var i = 0; i < data.length; i++) {
      sum = sum + data[i];
    }
    double avg = sum / data.length;

    print("Rata-rata (mean):");
    print(avg);
  }

  void median() {
    double median = 0;
    var middle = data.length ~/ 2;
    if (data.length % 2 == 1) {
      median = data[middle];
    } else {
      median = (data[middle - 1] + data[middle]) / 2.0;
    }

    print("Nilai tengah (median) :");
    print(median);
  }

  void modus(){
    int modus = 0;
    int maxCount = 0;

    for (var i = 0; i < data.length; ++i) {
      int count = 0;
      for (var j = 0; j < data.length; ++j) {
        if (data[j] == data[i]) ++count;
      }
      if (count > maxCount) {
        maxCount = count;
        modus = data[i];
      }
    }
    print("Nilai yang sering muncul (modus) :");
    print(modus);
  }
}

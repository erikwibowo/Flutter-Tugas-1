import 'package:collection/collection.dart';
import 'package:stats/stats.dart';

void main() {
  var tugas = Tugas();
  tugas.asc();
  tugas.desc();
  tugas.avg();
  tugas.median();
  tugas.modus();
}

class Tugas {
  // buat List dengan tipe data List<int> agar bisa menggunakan package stats
  List<int> data = [3, 18, 45, 16, 2, 5, 7, 9, 10, 1, 16, 11, 4, 8, 11, 16, 32, 56];

  void asc() {
    // sudah bagus dengan memanfaatkan fungsi sort() yang sudah ada..
    // data.sort((a, b) => a.compareTo(b));
    // print("Dari kecil ke besar :");
    // print(data);

    // alternatif
    // bisa langsung gini ajah gaperlu di compare
    data.sort();
    print("Dari kecil ke besar :");
    print(data);
  }

  void desc() {
    // sudah bagus dengan memanfaatkan fungsi sort() yang sudah ada..
    // data.sort((a, b) => b.compareTo(a));
    // print("Dari besar ke kecil :");
    // print(data);

    // alternatif
    // bisa manfaatin fungsi sort juga & reversed yaa
    print("Dari besar ke kecil :");
    data.sort();
    print(data.reversed.toList());
  }

  void avg() {
    // output & logic sudah sesuai dan benar
    // num sum = 0;
    // for (var i = 0; i < data.length; i++) {
    //   sum = sum + data[i];
    // }
    // double avg = sum / data.length;

    // print("Rata-rata (mean):");
    // print(avg);

    // alternatif 1
    // kalau for loop dan tidak membutuhkan index bisa pakai in pada for loop
    // var sum = 0;
    // for (int i in data) {
    //   sum += i;
    // }
    // print("Rata-rata (mean):");
    // print(sum / data.length);

    // alternatif 2
    // bisa menggunakan package stats
    print("Rata-rata (mean):");
    print(Stats.fromData(data).average);
  }

  void median() {
    // output & logic sudah sesuai dan benar, tetapi penggunaan tipe data masih error kalau data bertipe List<int>
    // double median = 0;
    // var middle = data.length ~/ 2;
    // if (data.length % 2 == 1) {
    //   median = data[middle];
    // } else {
    //   median = (data[middle - 1] + data[middle]) / 2.0;
    // }

    // print("Nilai tengah (median) :");
    // print(median);

    // alternatif
    // bisa menggunakan package stats
    print("Nilai tengah (median) :");
    print(Stats.fromData(data).median);
  }

  void modus() {
    // solusi ini belum sempurna, apabila data array ada yg memiliki jumlah maksimal yg sama,
    // apakah dari array tersebut ada modusnya ? tentu tidak ada modus
    // karena modus adalah nilai yg paling banyak muncul
    // int modus = 0;
    // int maxCount = 0;

    // for (var i = 0; i < data.length; ++i) {
    //   int count = 0;
    //   for (var j = 0; j < data.length; ++j) {
    //     if (data[j] == data[i]) ++count;
    //   }
    //   if (count > maxCount) {
    //     maxCount = count;
    //     modus = data[i];
    //   }
    // }
    // print("Nilai yang sering muncul (modus) :");
    // print(modus);

    // alternatif
    print("\n\nMODUS\n");
    data.sort();

    List<Map<int, int>> dataMap = [];
    List<Map<int, int>> fixDataMap = [];

    for (int i = 0; i < data.length; i++) {
      int total = 0;
      for (int j = 0; j < data.length; j++) {
        if (data[i] == data[j]) {
          total++;
        }
      }
      dataMap.add({data[i]: total});
    }

    for (int i = 0; i < dataMap.length; i++) {
      if (i > 0) {
        if (const DeepCollectionEquality().equals(dataMap[i], dataMap[i - 1])) {
          continue;
        } else {
          fixDataMap.add(dataMap[i]);
        }
      } else {
        fixDataMap.add(dataMap[i]);
      }
    }

    print("Data Map dengan banyaknya data");
    print(fixDataMap);

    List<int> keyData = [];
    List<int> valueData = [];

    for (int i = 0; i < fixDataMap.length; i++) {
      keyData.add(fixDataMap[i].keys.first);
      valueData.add(fixDataMap[i].values.first);
    }

    print("\nExtract Data Map");
    print("Nilai : $keyData");
    print("Banyak : $valueData");
    print("\n--------------------------\nKESIMPULAN\n");

    int maksimalData = valueData[0];

    for (var i = 0; i < valueData.length; i++) {
      if (valueData[i] > maksimalData) {
        maksimalData = valueData[i];
      }
    }

    // print(maksimalData);

    int totalMaksimalData = 0;
    for (var item in valueData) {
      if (item == maksimalData) {
        totalMaksimalData++;
      }
    }

    maksimalData = valueData[0];
    int indexMaksimalData = 0;

    if (totalMaksimalData != 1) {
      print("Nilai yang sering muncul (modus) :");
      print("TIDAK ADA MODUS");
    } else {
      for (var i = 0; i < valueData.length; i++) {
        if (valueData[i] > maksimalData) {
          maksimalData = valueData[i];
          indexMaksimalData = i;
        }
      }

      print("Nilai yang sering muncul : ${keyData[indexMaksimalData]}\nSebanyak : ${valueData[indexMaksimalData]} x");
    }
  }
}

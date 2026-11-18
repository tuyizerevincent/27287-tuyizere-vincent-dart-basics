//student :<Tuyizere vincent>
// reg_No: <27287/2024>
//B2 ANSWER
/*
const String regNo = '27287';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  int count = 0;

  text = text.toLowerCase();

  for (int i = 0; i < text.length; i++) {
    if (text[i] == 'a' ||
        text[i] == 'e' ||
        text[i] == 'i' ||
        text[i] == 'o' ||
        text[i] == 'u') {
      count++;
    }
  }

  return count;
}

void main() {
  String name = "Tuyizere Vincent";

  int N = countVowels(name);

  print("Reg no: $regNo | D = $d | T = $t");
  print("$name has $N vowels");
}
*/


// B3 ANSWER ======================
const String regNo = '27287';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

String initials(String fullName) {
  String result = "";

  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return "";
  }

  List<String> names = fullName.split(RegExp(r'\s+'));

  for (String name in names) {
    result += name[0].toUpperCase() + ".";
  }

  return result;
}

void main() {
  print("Reg no: $regNo | D = $d | T = $t");

  print(initials("Tuyizere Vincent"));
  print(initials(" tuyizere  vincent "));
  print(initials(" "));
}

//student :<Tuyizere vincent>
// reg_No: <27287/2024>
//==================== B2 ANSWER ===========================

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

// =================== B3 ANSWER ======================
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

1.which input broke your first version 
->input is 'tuyizere  vincent ' broke my first version because it  contain  extra spaces
2.what did you change ?
->i used  full name = full name.trim(); 
 to remove space at the beginning and end
 ->i used fullname.split(regExp(r'\s+'));
 to handle multiple spaces between names.


//============================ C5 ANSWER =================

const String regNo = '27287';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void drawTriangle(int height) {
  if (height <= 0) {
    return;
  }

  for (int i = 1; i <= height; i++) {
    String spaces = " " * (height - i);
    String symbol = (i % 2 == 1)? "*" : "#";

    print(spaces + symbol * i);
  }
}

void main() {
  print("Reg no: $regNo | D = $d | T = $t");

  drawTriangle(d + 3);

  drawTriangle(0);
  drawTriangle(-2);
}

// i calculated the spaces on each
//row by subtracting the current
// row number from the total height

//========================== D2 ANSWER ==============================
// Student: Tuyizere Vincent
// Reg no:  27287
const String regNo = '27287';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // T.V.
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // T.V.
  if (phone.length != 10) {
    return 'INVALID';
  }

  String stars = List.filled(phone.length - 5, '*').join();

  return phone.substring(0, 3) + stars + phone.substring(phone.length - 2);
}

void main() {
  // T.V.
  print("Reg no: $regNo | D = $d | T = $t");

  int i = 1;
  int totalFees = 0;

  String phone = '0788123456';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print("Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}");

    i++;
  }

  print("Total fees: $totalFees RWF");
}

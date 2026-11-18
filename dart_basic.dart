//student :<Tuyizere vincent>
// reg_No: <27287/2024>
//B2 QUESTION 

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

  print("$name has $N vowels");
}


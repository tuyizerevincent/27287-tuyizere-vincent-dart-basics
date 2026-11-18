// Student: Tuyizere Vincent
// Reg no:  27287
const String regNo = '27287';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

//MoMo fee function
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

//Format money with commas
String formatRwf(int amount) {
  // T.V.
  if (amount == 0) {
    return "0RWF";
  }

  bool negative = amount < 0;
  String digits = amount.abs().toString();

  List<String> groups = [];

  while (digits.length > 3) {
    groups.insert(0, digits.substring(digits.length - 3));
    digits = digits.substring(0, digits.length - 3);
  }

  groups.insert(0, digits);

  String result = groups.join(",");

  if (negative) {
    result = "-$result";
  }

  return "$result RWF";
}

//Check PIN validity
bool isValidPin(String pin) {
  // T.V.
  if (pin.length != 5) {
    return false;
  }

  if (pin == "12345") {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (int.tryParse(pin[i]) == null) {
      return false;
    }
    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

// Send money
int sendMoney(int balance, int amount) {
  // T.V.
  int fee = momoFee(amount);

  if (fee == -1) {
    print("Failed: invalid amount");
    return balance;
  }

  if (amount + fee > balance) {
    print("Failed: insufficient balance");
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    "Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). "
    "New balance: ${formatRwf(newBalance)}",
  );

  return newBalance;
}

//Buy airtime
int buyAirtime(int balance, int amount) {
  // T.V.
  if (amount < 100 || amount > 50000) {
    print("Failed: invalid airtime amount");
    return balance;
  }

  if (amount > balance) {
    print("Failed: insufficient balance");
    return balance;
  }

  int newBalance = balance - amount;

  print(
    "Airtime ${formatRwf(amount)}. "
    "New balance: ${formatRwf(newBalance)}",
  );

  return newBalance;
}

void main() {
  // T.V.
  print("Reg no: $regNo | D = $d | T = $t");

  // PIN tests
  print("12345: ${isValidPin('12345')}");
  print("4821$d: ${isValidPin('4821$d')}");
  print("77777: ${isValidPin('77777')}");
  print("4821: ${isValidPin('4821')}");
  print("48a21: ${isValidPin('48a21')}");

  // Starting balance
  int balance = 20000 + t * 500;

  print("Starting balance: ${formatRwf(balance)}");

  // Send money three times
  int amount = (d + 1) * 3000;

  int i = 1;

  while (i <= 3) {
    print("Transaction $i:");
    balance = sendMoney(balance, amount);
    i++;
  }

  // Buy airtime
  print("Buy airtime:");
  balance = buyAirtime(balance, 1000);

  // Send 200000
  print("Send 200000:");
  balance = sendMoney(balance, 200000);

  // Final balance
  print("Final balance: ${formatRwf(balance)}");

  // Additional test calls

  print(formatRwf(0));
  print(formatRwf(1250000));
  print(formatRwf(-5000));
  print(isValidPin("54321"));
  print(isValidPin("11111"));
  print(isValidPin("12a45"));
}
//The third transaction surprised me because the remaining balance was only 15,000 RWF,
//which was not enough to send 24,000 RWF plus the 250 RWF fee.

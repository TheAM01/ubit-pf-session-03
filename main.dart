import "./1a.dart" as q1a;
import "./1b.dart" as q1b;
import "./1c.dart" as q1c;
import "./2.dart" as q2;
import "./3.dart" as q3;
import "./utils.dart";

import "dart:io";

void main() {

    clear();

    List<Function> functions = [
        q1a.main,
        q1b.main,
        q1c.main,
        q2.main,
        q3.main
    ];

    stdout.write("Select a question to execute.\n\n1. Question 1(a)\t\t\t2. Question 1(b)\n3. Question 1(c)\t\t\t4. Question 2\n5. Question 3\t\t\t\t0. Exit\n\n> ");
    String inputRaw = stdin.readLineSync()!;

    int? input;

    try {
        input = int.parse(inputRaw);
    } on Exception {
        print("Invalid option. Please enter the integer 0-${functions.length} corresponding to the options above.\nPress enter to try again.");
        stdin.readLineSync()!;
        return main();
    }

    if (input > functions.length) {
        print("Invalid option. Please enter the integer 0-${functions.length} corresponding to the options above.\nPress enter to try again.");
        stdin.readLineSync()!;
        return main();
    }

    if (input == 0) {
        exit(1);
    }

    functions[input-1].call();

    return main();

}
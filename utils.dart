import "dart:io";

void clear() {
    print("\x1B[2J\x1B[0;0H");   
}

String readLineAsString(message) {
    stdout.write("$message ");
    return stdin.readLineSync()!;
}

int readLineAsInt(message) {
    stdout.write("$message ");
    return int.parse(stdin.readLineSync()!);
}
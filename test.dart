import "dart:io";
import "dart:async";

void main() async {

    await printFancy("Hi! this is a very long string. A quick brown fox jumps over the lazy dog.");
    await printFancy("This is a \"Hello, world!\" program but...");
    await printFancy("fancier.");

}

Future<void> printFancy(String data) async {
    List<String> sample = data.split("");


    for (var element in sample) {
        await Future.delayed(Duration(milliseconds: (50)));
        if (element == ".") await Future.delayed(Duration(milliseconds: (750)));
        stdout.write(element);
    }

    stdout.write('\n');

}
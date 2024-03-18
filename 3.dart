import "dart:io";

void main() {

    clear();

    List<String> months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ];

    String dateRaw = readLineAsString("Enter date in the format dayOfTheMonth-MonthName-year:");

    int day = int.parse(dateRaw.split("-")[0]);
    int month = months.indexOf(dateRaw.split("-")[1])+1;
    int year = int.parse(dateRaw.split("-")[2]);

    if (!valiDate(day, month, year)) {
        int exitNum = readLineAsInt("invalid date\nEnter 1 to restart and 0 to exit:");
        if (exitNum == 0) {
            clear();
            exit(1);
        }
        return main();
    }

    Map newDate = dateIncrement(day, month, year);
    int exitNum = readLineAsInt("Next date of entered date: ${newDate[day]}-${months[newDate[month]-1]}-${newDate[year]}.\nEnter 1 to restart and 0 to exit:");
    if (exitNum == 0) {
        clear();
        exit(1);
    }
    return main();

}

String readLineAsString(message) {
    stdout.write("$message ");
    return stdin.readLineSync()!;
}

int readLineAsInt(message) {
    stdout.write("$message ");
    return int.parse(stdin.readLineSync()!);
}

bool valiDate(int day, int month, int year) {

    List<int> months = [
        31,
        28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31
    ];

    if (year%4 == 0) months[1] = 29;

    if (day < 1 || month < 1) return false;

    if (month > 12) return false;

    if (day > months[month-1]) return false;

    return true;
    
}

Map dateIncrement(day, month, year) {

    DateTime parsed = DateTime(year, month, day+1);

    List sample = parsed.toString().split(" ")[0].split("-");

    return {
        day: int.parse(sample[2]),
        month: int.parse(sample[1]),
        year: int.parse(sample[0]),
    };

}

void clear() {
    print("\x1B[2J\x1B[0;0H");   
}

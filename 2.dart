import "dart:io";

bool main() {

    clear();

    List months = [
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
    
    int day = readLineAsInt("Enter a day:");
    day = int.parse("0$day".substring(day.toString().length - 1));

    int month = readLineAsInt("Enter a month:");
    month = int.parse("0$month".substring(month.toString().length - 1));

    int year = readLineAsInt("Enter a year:");
    
    if (!valiDate(day, month, year)) {
        int exitNum = readLineAsInt("invalid date\nEnter 1 to restart and 0 to exit:");
        if (exitNum == 0) {
            clear();
            return true;
        }
        return main();
    }

    String weekday = findWeekDay(day, month, year);    
    int exitNum = readLineAsInt("$day-${months[month-1]}-$year is \"$weekday\".\nPress 1 to restart and 0 to exit:");
    if (exitNum == 0) {
        clear();
        return true;
    };

    main(); // funny recursion
    return false;
}

String readLineAsString(message) {
    stdout.write("$message ");
    return stdin.readLineSync()!;
}

int readLineAsInt(message) {
    stdout.write("$message ");
    return int.parse(stdin.readLineSync()!);
}

String findWeekDay(int day, int month, int year) {

    List days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ];

    int weekdayInt = DateTime(year, month, day).weekday;
    String weekday = days[weekdayInt - 1];

    return weekday;
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

    if (year%4 == 0) months[1] = 29; // if year is leap, add a day to february;

    if (day < 1 || month < 1) return false; // incase day or month is input as 0;

    if (month > 12) return false; // self explanatory

    if (day > months[month-1]) return false; // incase input day is greater than the actual amount of days in the month;

    // cant think of any more cases ¯\_(ツ)_/¯

    return true;

}

void clear() {
    print("\x1B[2J\x1B[0;0H");   
}
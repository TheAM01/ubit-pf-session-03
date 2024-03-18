import "dart:io";

void main() {

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

    int day = readLine("Enter a day:");
    int month = readLine("Enter a month:");


    if (day > 31 || month > 12) {

        int exitNum = readLine("Invalid date. Press 1 to retry, 0 to exit:");
        if (exitNum == 0) exit(1);

        clear();
        return main();

    }

    String weekday = findWeekDay(day, month, 2024);
    int exitNum = readLine("The weekday on $day-${months[month-1]}-2024 is \"$weekday\".\nPress 1 to restart and 0 to exit:");
    if (exitNum == 0) exit(1);
    main();

}

int readLine(message) {
    stdout.write("$message ");
    return int.parse(stdin.readLineSync()!);
}

String findWeekDay(day, month, year) {

    List days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ];

    int weekdayInt = DateTime(2024, month, day).weekday;
    String weekday = days[weekdayInt - 1];

    return weekday;
}

void clear() {
    print("\x1B[2J\x1B[0;0H");   
}
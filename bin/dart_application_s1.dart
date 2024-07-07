class BankAccount {
  int accountID;
  double balance;

  BankAccount(this.accountID, this.balance);

  BankAccount.defaultAccount(this.accountID) : balance = 0;

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      print('Withdrawn: \$$amount, New Balance: \$$balance');
    } else {
      print('Insufficient balance.');
    }
  }

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$$amount, New Balance: \$$balance');
  }
}

class Holiday {
  String name;
  int day;
  String month;

  Holiday(this.name, this.day, this.month);

  static bool inSameMonth(Holiday h1, Holiday h2) {
    return h1.month == h2.month;
  }

  static double avgDate(List<Holiday> holidays) {
    int totalDays = holidays.fold(0, (sum, holiday) => sum + holiday.day);
    return totalDays / holidays.length;
  }
}

class Movie {
  String title;
  String studio;
  String rating;

  Movie(this.title, this.studio, {this.rating = 'PG'});

  static List<Movie> getPG(List<Movie> movies) {
    return movies.where((movie) => movie.rating.contains('PG')).toList();
  }
}

void main() {
  Holiday independenceDay = Holiday('Independence Day', 4, 'July');
  Holiday newYear = Holiday('New Year', 1, 'January');

  print('Same Month: ${Holiday.inSameMonth(independenceDay, newYear)}');

  List<Holiday> holidays = [
    independenceDay,
    Holiday('Christmas', 25, 'December'),
    Holiday('Halloween', 31, 'October')
  ];

  print('Average Date: ${Holiday.avgDate(holidays)}');

  Movie casinoRoyale =
      Movie('Casino Royale', 'Eon Productions', rating: 'PG13');
  print(
      'Movie: ${casinoRoyale.title}, Studio: ${casinoRoyale.studio}, Rating: ${casinoRoyale.rating}');

  List<Movie> movies = [
    casinoRoyale,
    Movie('Inception', 'Warner Bros.', rating: 'PG13'),
    Movie('Finding Nemo', 'Pixar', rating: 'PG'),
    Movie('The Dark Knight', 'Warner Bros.', rating: 'PG13')
  ];

  List<Movie> pgMovies = Movie.getPG(movies);
  print('PG Movies:');
  for (var movie in pgMovies) {
    print(
        'Title: ${movie.title}, Studio: ${movie.studio}, Rating: ${movie.rating}');
  }

  BankAccount account1 = BankAccount(1, 1000);
  account1.deposit(500);
  account1.withdraw(200);
  account1.withdraw(1500);

  BankAccount account2 = BankAccount.defaultAccount(2);
  account2.deposit(300);
  account2.withdraw(100);
}

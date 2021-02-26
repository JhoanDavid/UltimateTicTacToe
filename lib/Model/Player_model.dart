class Player {
  String name;
  int score = 0;
  Player({this.name, this.score});

  void incrementScore() {
    this.score++;
  }

  void resetScore() {
    this.score = 0;
  }
}

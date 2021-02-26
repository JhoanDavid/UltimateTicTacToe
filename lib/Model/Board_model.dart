class Board {
  var board = ['', '', '', '', '', '', '', '', ''];
  Board({this.board});

  void insertValue(index, playerNum) {
    String value;
    if (playerNum == 1) {
      value = "O";
    } else {
      value = "X";
    }
    this.board[index] = value;
  }

  void resetBoard() {
    this.board = ['', '', '', '', '', '', '', '', ''];
  }
}

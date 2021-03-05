import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

class Game {
  Player player1;
  Player player2;
  Board board;
  int move = 0;
  int roundsNum = 0;
  int actualRound = 1;
  bool state = false;
  Game(
      {this.player1,
      this.player2,
      this.board,
      this.roundsNum,
      this.actualRound,
      this.state,
      this.move});
}

/*player.score>(rounds/2) ganador (bloc)


  void incrementScore() {
    this.score++;
  }

  void resetScore() {
    this.score = 0;
  }
  
void incrementActualRound() {
    this.actualRound++;
  }

  void resetActualRound() {
    this.actualRound = 1;
  }

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

*/

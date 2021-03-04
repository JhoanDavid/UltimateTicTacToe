import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

class GameBloc {
  int count;
  Game _game;
  Board _board;

  GameBloc() {
    _game = Game();
    _board = Board();
  }

  Game createGame(Game game) {
    _game.board = _board;
    _game.player1 = game.player1;
    _game.player2 = game.player2;
    _game.player1.number = 1;
    _game.player2.number = 2;
    this.count = 0;

    return _game;
  }

  bool possibleWinRound(Board board, String turn) {
    if ((board.board[0] == turn &&
            board.board[1] == turn &&
            board.board[2] == turn) ||
        (board.board[0] == turn &&
            board.board[3] == turn &&
            board.board[6] == turn) ||
        (board.board[0] == turn &&
            board.board[4] == turn &&
            board.board[8] == turn) ||
        (board.board[1] == turn &&
            board.board[4] == turn &&
            board.board[7] == turn) ||
        (board.board[2] == turn &&
            board.board[5] == turn &&
            board.board[8] == turn) ||
        (board.board[2] == turn &&
            board.board[4] == turn &&
            board.board[6] == turn) ||
        (board.board[3] == turn &&
            board.board[4] == turn &&
            board.board[5] == turn) ||
        (board.board[6] == turn &&
            board.board[7] == turn &&
            board.board[8] == turn)) {
      return true;
    } else {
      return false;
    }
  }

  Player verifyRoundWin(Game game) {
    this._board = game.board;
    if (possibleWinRound(_board, 'X')) {
      incrementScore(game.player1);
      game.roundsNum++;
      return game.player1;
    } else if (possibleWinRound(_board, 'O')) {
      incrementScore(game.player2);
      game.roundsNum++;
      return game.player2;
    } else {
      game.roundsNum++;
      return null;
    }
  }

  void insertValue(int index, Game game) {
    String value;
    if (game.player1.number == 1) {
      value = "O";
    } else {
      value = "X";
    }

    game.board.board[index] = value;
    count++;
    verifyMoviments(game, count);
  }

  Player verifyMoviments(Game game, int count) {
    if (count >= 6) {
      if (this.verifyRoundWin(game) == null) {
        print("en juego");
      } else {
        return this.verifyRoundWin(game);
      }
    }
  }

  Player verifyGameWinner(Game game) {
    double rounds = game.roundsNum / 2;
    if (game.player1.score > rounds) {
      resetScore(game);
      return game.player1;
    } else {
      resetScore(game);
      return game.player2;
    }
  }

  void incrementScore(Player player) {
    player.score++;
  }

  void resetScore(Game game) {
    game.player1.score = 0;
    game.player2.score = 0;
    this.count == 0;
  }

  Game incrementActualRound(Game game) {
    game.roundsNum++;
    return game;
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

}

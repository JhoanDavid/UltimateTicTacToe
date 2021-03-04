import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

class GameBloc {
  int count;
  Game _game;
  Board _board;
  Player _player;

  GameBloc() {
    _game = Game();
    _board = Board();
    _player = Player();
    count = 0;
  }

  Game createGame(Game game) {
    _game.player1 = game.player1;
    _game.player2 = game.player2;
    _game.player1.number = 1;
    _game.player2.number = 2;
    _game.board = _board;
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
      game.player1.score = incrementScore(game.player1);
      game.actualRound++;
      return game.player1;
    } else if (possibleWinRound(_board, 'O')) {
      game.player2.score = incrementScore(game.player2);
      game.actualRound++;
      return game.player2;
    } else {
      game.actualRound++;
      return null;
    }
  }

  Board insertValue(int index, Game game, int numPlay) {
    String value;
    if (game.player1.number == numPlay) {
      value = "X";
    } else {
      value = "O";
    }

    game.board.board[index] = value;
    count++;
    if (verifyMoviments(game, count) != null) {
      verifyMoviments(game, count);
    }
    return game.board;
  }

  void GameOver(Game game) {
    if (game.actualRound == game.roundsNum) {
      _player = verifyGameWinner(game);
      print("El ganador es" + _player.name);
    }
  }

  Player verifyMoviments(Game game, int count) {
    if (count >= 6) {
      if (this.verifyRoundWin(game) == null) {
        print("en juego");
      } else {
        return this.verifyRoundWin(game);
      }
    } else {
      return null;
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

  int incrementScore(Player player) {
    return player.score++;
  }

  void resetScore(Game game) {
    game.player1.score = 0;
    game.player2.score = 0;
    game.roundsNum = 0;
    game.actualRound = 1;
    this.count == 0;
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

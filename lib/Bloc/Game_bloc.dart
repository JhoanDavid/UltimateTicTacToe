import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';

import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';

class GameBloc {
  Game _game;
  Board _board;
  Player _player;

  GameBloc() {
    _game = Game();
    _board = Board();
    _player = Player();
  }

  Game createGame(Game game) {
    _game.player1 = game.player1;
    _game.player2 = game.player2;
    _game.player1.number = 1;
    _game.player2.number = 2;
    _game.move = 0;
    _game.board = _board;

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
    print(game.board);
    if (possibleWinRound(game.board, 'X')) {
      game.player1.score++;
      print(game.board.board);
      resetBoard(game);
      print(game.board.board);
      game.actualRound++;
      return game.player1;
    } else if (possibleWinRound(game.board, 'O')) {
      game.player2.score++;
      print(game.board.board);
      resetBoard(game);
      print(game.board.board);
      game.actualRound++;
      return game.player2;
    } else {
      print('empate');
      game.actualRound++;
      return null;
    }
  }

  Board insertValue(int index, Game game, int numPlay) {
    String value;
    if (game.player1.number == numPlay) {
      value = 'X';
    } else {
      value = 'O';
    }
    print(value);
    if (game.board.board[index] == '') {
      game.board.board[index] = value;
      print(game.board.board);
      game.move++;
      print(game.move);
      if (verifyMoviments(game) != null) {
        verifyMoviments(game);
      }
    }
    return game.board;
  }

  void gameOver(Game game) {
    if (game.actualRound == game.roundsNum) {
      _player = verifyGameWinner(game);
      print('El ganador es' + _player.name);
    }
  }

  Player verifyMoviments(Game game) {
    if (game.move >= 5) {
      if (verifyRoundWin(game) == null) {
        print('en juego');
        return null;
      } else {
        return verifyRoundWin(game);
      }
    } else {
      return null;
    }
  }

  Player verifyGameWinner(Game game) {
    var rounds = game.roundsNum / 2;
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
  }

  void resetBoard(Game game) {
    game.board.board = ['', '', '', '', '', '', '', '', ''];
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

  
*/

}

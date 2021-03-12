import 'package:test/test.dart';
import 'package:ultimate_tic_tac_toe/Bloc/Game_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';

void main() {
  var gameBloc = GameBloc();
  var game = Game(
      player1: Player(name: 'Oscar', number: 1, score: 0),
      player2: Player(name: 'Alberto', number: 2, score: 0),
      board: Board(board: ['', '', '', '', '', '', '', '', '']),
      actualRound: 1,
      move: 0,
      roundsNum: 5);
  test('insert value X', () {
    expect(gameBloc.insertValue(0, game, 1).board[0], 'X');
  });
  test('Insert value O', () {
    expect(gameBloc.insertValue(0, game, 2).board[0], 'O');
  });
  test('possibleWinRound X', () {
    var board = Board(board: ['X', 'X', 'X', '', '', 'O', '', 'O', '']);

    expect(gameBloc.possibleWinRound(board, 'X'), true);
  });
  test('possibleWinRound O', () {
    var board = Board(board: ['O', 'O', 'O', '', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, 'O'), true);
  });

  test('possibleWinRound X false', () {
    var board = Board(board: ['O', 'O', '', 'O', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, 'X'), false);
  });
  test('possibleWinRound O false', () {
    var board = Board(board: ['O', 'O', '', 'O', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, 'O'), false);
  });
}
import 'package:test/test.dart';
import 'package:ultimate_tic_tac_toe/Bloc/Game_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

void main() {
  GameBloc gameBloc = GameBloc();
  Game game = Game(
      player1: Player(name: "Oscar", number: 1, score: 0),
      player2: Player(name: "Alberto", number: 2, score: 0),
      board: Board(board: ['', '', '', '', '', '', '', '', '']),
      actualRound: 1,
      move: 0,
      roundsNum: 5);
  test("insert value X", () {
    print(game.board.board);
    List<String> l = gameBloc.insertValue(0, game, 1).board;

    expect(gameBloc.insertValue(0, game, 1).board[0], 'X');
  });
  test("Insert value O", () {
    print(game.board.board);

    expect(gameBloc.insertValue(0, game, 2).board[0], 'O');
  });
  test("possibleWinRound X", () {
    Board board = Board(board: ['X', 'X', 'X', '', '', 'O', '', 'O', '']);

    expect(gameBloc.possibleWinRound(board, "X"), true);
  });
  test("possibleWinRound O", () {
    Board board = Board(board: ['O', 'O', 'O', '', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, "O"), true);
  });

  test("possibleWinRound X false", () {
    Board board = Board(board: ['O', 'O', '', 'O', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, "X"), false);
  });
  test("possibleWinRound O false", () {
    Board board = Board(board: ['O', 'O', '', 'O', '', 'X', '', 'X', '']);

    expect(gameBloc.possibleWinRound(board, "O"), false);
  });
}

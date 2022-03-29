import 'package:flutter/material.dart';

class play extends StatefulWidget {
  const play({Key? key}) : super(key: key);
  _playState createState() => _playState();
}

class _playState extends State<play> {
  List<String> tab = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  double grid_size = 100;
  bool oTurn = true;
  // 1st plyer is O
  int filledBox = 0;

  var xo_turn = 'O';
  void _whoTurn() {
    setState(() {
      if (oTurn == true) {
        xo_turn = 'O';
      } else {
        xo_turn = 'X';
      }
    });
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && tab[index] == '') {
        tab[index] = xo_turn;
        filledBox++;
      } else if (!oTurn && tab[index] == '') {
        tab[index] = xo_turn;
        filledBox++;
      }
      _checkWinner();
      oTurn = !oTurn;
      _whoTurn();
    });
  }

  void _checkWinner() {
    if (tab[0] == tab[1] && tab[0] == tab[2] && tab[0] != '') {
      _showWinDialog(tab[0]);
    }

    if (tab[3] == tab[4] && tab[3] == tab[5] && tab[3] != '') {
      _showWinDialog(tab[3]);
    }

    if (tab[6] == tab[7] && tab[6] == tab[8] && tab[6] != '') {
      _showWinDialog(tab[6]);
    }

    if (tab[0] == tab[3] && tab[0] == tab[6] && tab[0] != '') {
      _showWinDialog(tab[0]);
    }

    if (tab[1] == tab[4] && tab[1] == tab[7] && tab[1] != '') {
      _showWinDialog(tab[1]);
    }

    if (tab[2] == tab[5] && tab[2] == tab[8] && tab[2] != '') {
      _showWinDialog(tab[2]);
    }

    if (tab[0] == tab[4] && tab[0] == tab[8] && tab[0] != '') {
      _showWinDialog(tab[0]);
    }

    if (tab[2] == tab[4] && tab[2] == tab[6] && tab[2] != '') {
      _showWinDialog(tab[2]);
    } else if (filledBox == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner + " is the Winner"),
            actions: [
              FlatButton(
                child: Text('Play Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _clearBoard();
                },
              ),
            ],
          );
        });
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" Draw "),
            actions: [
              FlatButton(
                child: Text('Pay Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _clearBoard();
                },
              ),
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        tab[i] = '';
      }
    });
    filledBox = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.border_all, size: 30, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black, /* fontWeight: FontWeight.bold*/
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 30, color: Colors.black),
            onPressed: () {
              _clearBoard();
            },
            tooltip: 'new game',
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app, size: 30, color: Colors.black),
            onPressed: () {},
            tooltip: 'exit',
          ),
          PopupMenuButton(
            icon: Icon(Icons.menu_open, size: 30, color: Colors.black),
            color: Colors.grey,
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('settings')),
              PopupMenuItem(child: Text('about us'))
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(0);
                      });
                    },
                    child: Text('${tab[0]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(1);
                      });
                    },
                    child: Text('${tab[1]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(2);
                      });
                    },
                    child: Text('${tab[2]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(3);
                      });
                    },
                    child: Text('${tab[3]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(4);
                      });
                    },
                    child: Text('${tab[4]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(5);
                      });
                    },
                    child: Text('${tab[5]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.redAccent,
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(6);
                      });
                    },
                    child: Text('${tab[6]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(7);
                      });
                    },
                    child: Text('${tab[7]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
                Container(
                  height: grid_size,
                  width: grid_size,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tapped(8);
                      });
                    },
                    child: Text('${tab[8]}', textAlign: TextAlign.center, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  margin: EdgeInsets.all(10.0),
                  child: Text("${xo_turn}' Turn", textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Robot')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 200,
                  margin: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _clearBoard();
                      },
                      child: Text(
                        'reload game',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Robot'),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

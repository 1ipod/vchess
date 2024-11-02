struct Piece{
    kind PieceType
    rank int
    file int
    white bool
}

struct Empty{}

struct Move{
    first_piece Piece
    second_piece Piece
}

type Square = Empty | Piece

fn (piece Piece)moves(board [][]Square, lastmove Move)[]Move{
    mut out := []Move
    match piece.kind{
        .pawn{
            dist := (int(piece.white) * 2) -1
            double := 2 * dist
            if board[piece.rank + dist ][piece.file].type_name() == "Empty"{
                if piece.rank + dist == (int(piece.white)*7){
                    for x in [PieceType.bishop,PieceType.knight,PieceType.rook,PieceType.queen] {
                        rpiece := Piece{
                            kind: x
                            rank: piece.rank + dist
                            file: piece.file
                            white: piece.white
                        }
                        out << Move{piece, rpiece}
                    } 
                } else {
                    rpiece := Piece{
                        kind: piece.kind
                        rank: piece.rank + dist
                        file: piece.file
                        white: piece.white
                    }
                    out << Move{piece, rpiece}
                }
            }
            if piece.rank == (1+(int(!piece.white)*5)){
            if board[piece.rank + double][piece.file].type_name() == "Empty"{
                rpiece := Piece{
                    kind: piece.kind
                    rank: piece.rank + double
                    file: piece.file
                    white: piece.white
                }
                out << Move{piece, rpiece}
            }}
            if piece.file != 0{
                if board[piece.rank + dist][piece.file - 1].type_name() != "Empty"{
                    if (board[piece.rank + dist][piece.file - 1] as Piece).white != piece.white{
                        rpiece := Piece{
                            kind: piece.kind
                            rank: piece.rank + dist
                            file: piece.file - 1
                            white: piece.white
                        }
                        out << Move{piece, rpiece}
                    }
                }
            }
            if piece.file != 7{
                if board[piece.rank + dist][piece.file + 1].type_name() != "Empty"{
                    if (board[piece.rank + dist][piece.file + 1] as Piece).white != piece.white{
                        rpiece := Piece{
                            kind: piece.kind
                            rank: piece.rank + dist
                            file: piece.file + 1
                            white: piece.white
                        }
                        out << Move{piece, rpiece}
                    }
                }
            }
        }
        else{

        }
    } 
    print(piece)
    print(out)
    return out
}

enum PieceType{
    pawn
    bishop
    knight
    rook
    queen
}

fn main(){
    Piece{
        rank:5
        file:5
        kind:.pawn
        white:true
    }.moves([][]Square, Move{})
}
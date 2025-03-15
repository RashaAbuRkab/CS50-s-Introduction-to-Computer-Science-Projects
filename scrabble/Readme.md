# Scrabble
![image](https://github.com/user-attachments/assets/66afb37e-511f-4a25-9b58-2fc9027fb29f)

# Problem To Solve :

In the game of Scrabble, players create words to score points, and the number of points is the sum of the point values of each letter in the word.
![image](https://github.com/user-attachments/assets/511578d3-2ce5-4d98-8c78-387209b23312)

For example, if we wanted to score the word “CODE”, we would note that the ‘C’ is worth 3 points, the ‘O’ is worth 1 point, the ‘D’ is worth 2 points, and the ‘E’ is worth 1 point. Summing these, we get that “CODE” is worth 7 points.

In a file called scrabble.c in a folder called scrabble, implement a program in C that determines the winner of a short Scrabble-like game. Your program should prompt for input twice: once for “Player 1” to input their word and once for “Player 2” to input their word. Then, depending on which player scores the most points, your program should either print “Player 1 wins!”, “Player 2 wins!”, or “Tie!” (in the event the two players score equal points).


# Example :
```bash
$ ./scrabble
Player 1: Question?
Player 2: Question!
Tie!



$ ./scrabble
Player 1: red
Player 2: wheelbarrow
Player 2 wins!


$ ./scrabble
Player 1: COMPUTER
Player 2: science
Player 1 wins!


$ ./scrabble
Player 1: Scrabble
Player 2: wiNNeR
Player 1 wins!
```

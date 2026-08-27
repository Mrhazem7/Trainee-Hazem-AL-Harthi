#include <iostream>
using namespace std;

void showWelcome(){
    string playerName;
    cout << "Enter your name: ";
    getline(cin, playerName);
    cout << "Welcome " << playerName << "! Let's play Guess the Number.\n";
}

void playGame(){
    int secretNumber = 7;
    int guess;
    int attempts = 0;

    cout << "I'm thinking of a number between 1 and 10.\n";

    do {
        cout << "Enter your guess: ";
        cin >> guess;
        attempts++;

        if (guess > secretNumber){
            cout << "Too high! Try again.\n";
        } else if (guess < secretNumber){
            cout << "Too low! Try again.\n";
        } else {
            cout << "Correct! You guessed it in " << attempts << " attempts.\n";
        }

    } while (guess != secretNumber);
}

int main(){
    showWelcome();
    playGame();
    return 0;
}
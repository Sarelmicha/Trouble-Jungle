//
//  ViewController.swift
//  TroubleJungle
//
//  Created by user167401 on 4/17/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import AVFoundation

class GameController: UIViewController {
    
    @IBOutlet weak var game_LBL_moves: UILabel!
    @IBOutlet weak var game_LBL_timer: UILabel!
    
    @IBOutlet weak var game_STACKVIEW_cardsHolder: UIStackView!
    
    
    
    let MAX_IDENTICAL_CARDS :Int = 2;
    
    
    //Variables
    var numOfRows : Int!;
    var numOfCardsPerRow : Int!;
    var numOfCards : Int!;
    var cards = [Card]();
    var firstCard : Card?;
    var raffle : Bool = true;
    var isClickable : Bool = true;
    var moves : Int = 0;
    var timePassed : Int = 0;
    var audioPlayer : AVAudioPlayer!;
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        initCards(numOfRows: numOfRows, numOfCardsPerRow: numOfCardsPerRow);
        raffleCards();
        playBackgorundMusic();
        startTimer();
        
    }
    
    @IBAction func flip(_ sender: Card) {
        
        if(!isClickable){
            // Player can't click a card - waiting for other cards to flip
            return;
        }
        
        if(sender.isFlipped){
            //Same card has been clicked.
            return;
        }
        
        
        handleCard(sender: sender);
        
    }
    
    func initCards(numOfRows : Int, numOfCardsPerRow : Int){
        
        numOfCards = numOfRows * numOfCardsPerRow;
        
        for _ in 0 ..< numOfRows {
            let row : UIStackView = createRow();
            for _ in 0 ..< numOfCardsPerRow {
                let newCard : Card = createCard();
                //Adding newCard to row Stackview
                row.addArrangedSubview(newCard);
                //Adding newCard to cards Array ref
                cards.append(newCard);
            }
            game_STACKVIEW_cardsHolder.addArrangedSubview(row);
        }
    }
    
    func createCard () -> Card {
        
        let newCard : Card = Card();
        newCard.addTarget(self, action: #selector(flip), for: .touchUpInside);
        
        return newCard;
    }
    
    func createRow () -> UIStackView {
        
        let SPACING: CGFloat = 10;
        let row = UIStackView();
        
        row.axis = .horizontal;
        row.alignment = .fill;
        row.distribution = .fillEqually;
        row.spacing = SPACING;
        row.contentMode = .scaleToFill;
        row.translatesAutoresizingMaskIntoConstraints = false
        
        return row;
    }
    
    func raffleCards()  {
        
        var images = [#imageLiteral(resourceName: "sloth"),#imageLiteral(resourceName: "monkey"),#imageLiteral(resourceName: "gorilla"),#imageLiteral(resourceName: "beatle"),#imageLiteral(resourceName: "crocodile"),#imageLiteral(resourceName: "tiger"),#imageLiteral(resourceName: "zebra"),#imageLiteral(resourceName: "frog")];
        var size = numOfCards / 2;
        var slots = [Int](repeating: 0, count: size);
        var randomIndex : Int;
        
        
        for card in cards{
            
            while(raffle){
                
                randomIndex = Int.random(in: 0 ..< size);
                
                if(slots[randomIndex] < MAX_IDENTICAL_CARDS){
                    raffle = false;
                    slots[randomIndex] += 1;
                    card.front = images[randomIndex];
                } else {
                    // The same card has already asign twice
                    images.remove(at: randomIndex);
                    slots.remove(at: randomIndex);
                    size -= 1;
                    
                }
            }
            // Reset for next round.
            raffle = true;
        }
        
    }
    
    func addMove() {
        
        moves += 1;
        game_LBL_moves.text  = String(moves);
        
    }
    
     func handleCard(sender : Card){
         
        if(firstCard == nil){
            //flip the first card
            sender.flip();
            
            firstCard = sender;
            
            //flip first card to reveal his image.
            
        } else {
            
            //flip second card to reveal his image.
            sender.flip();
            
            isClickable = false;
            
            checkForMatches(sender: sender);
            
        }
    }
    
    func checkForMatches(sender : Card){
        
        if(sender.front == firstCard!.front){
            
            //Guess was correct
            playerGuessedRight(sender: sender);
            
        } else {
            
            //Guess was incorrect
            playerGuessedWrong(sender: sender);
        }
    }
    
    func playerGuessedRight(sender : Card){
        
        
        sender.remove();
        firstCard?.remove();
        
        addMove();
        
        firstCard = nil;
        
        
        if(isVictory()){
            self.performSegue(withIdentifier: "goToGameOverPage", sender: self)
            //newGame();
        }
        
        //player can now guess again.
        isClickable = true;
        
    }
    
    
    func playerGuessedWrong(sender : Card) {
        
        addMove();
        //Delay for 2 seconds when revealing the second card.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 ) {
            
            // flip the cards back
            self.firstCard!.flip();
            sender.flip();
            
            // Player can guess again
            self.isClickable = true;
            
            // Reset first card
            self.firstCard = nil;
            
        }
    }
    
    func startTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            self.timePassed += 1;
            self.game_LBL_timer.text  = String(self.timePassed);
            
        }
        
    }
    
    func isVictory() -> Bool {
        
        for card in cards {
            if(!card.isFlipped){
                return false;
            }
        }
        return true;
    }
    
    
    func newGame () {
        
        resertCards();
        resetMoves();
        resetTimer();
        resetFliped();
        raffleCards();
    }
    
    func resertCards() {
        
        for card in cards {
            
            card.flip();
            card.add();
        }
    }
    
    func resetFliped() {
        for card in cards {
            card.isFlipped = false;
        }
    }
    
    func resetMoves() {
        
        moves = 0;
        game_LBL_moves.text  = String(moves);
        
    }
    
    func resetTimer() {
        
        timePassed = 0;
        game_LBL_timer.text  = String(timePassed);
        
    }
    
    func playBackgorundMusic() {
        let pathToSound = Bundle.main.path(forResource: "Classic Game Music", ofType: "mp3")!;
        let url = URL(fileURLWithPath: pathToSound);
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url);
            //play background music in loop
            audioPlayer.numberOfLoops = -1;
            audioPlayer.play();
        } catch {
            //Error handling.
            print("Couldn't find sound file...");
        }
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToGameOverPage"){
            let gameOverPage = segue.destination as! GameOverController
             //Set the game parameters
            gameOverPage.time = timePassed;
            gameOverPage.moves = moves
            gameOverPage.lastGameNumOfRows = numOfRows
            gameOverPage.lastGameNumOfCardsPerRow = numOfCardsPerRow
          
        }
    }
    
    
}


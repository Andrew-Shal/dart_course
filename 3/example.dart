void main(){
  var deck = new Deck();
  print(deck);
  deck.shuffle();
  print(deck);

  var diamondCards = deck.cardsWithSuit('Diamonds');
  print('Diamond Cards: ${diamondCards}');

  print(deck.deal(5));
}

class Deck{
  List<Card> cards = [];

  Deck(){
    var ranks = ['Ace','Two','Three','Four','Five'];
    var suits = ['Diamonds','Hearts','Clubs','Spades'];

    for(var suit in suits){
      for(var rnk in ranks){
        var card = new Card(suit:suit,rank:rank);
        cards.add(card);
      }
    }
  }
  toString(){
    return '${cards}';
  }
  shuffle(){
    cards.shuffle();
  }
  cardsWithSuit(String suit){
    return cards.where((cards) => card.suit == suit);
  }
  deal(int handSize){
    var hand = cards.sublist(0, handSize);
    this.cards = cards.sublist(handSize);

    return hand;
  }
  removeCard(String suit, String rank){
    cards.removeWhere((card) => card.rank == rank && card.suit == suit);
  }
}

class Card{
  Card({this.suit,this.rank});
  String suit;
  String rank;
  toString(){
    return '${rank} of ${suit}';
  }
}
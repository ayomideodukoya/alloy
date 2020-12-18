class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;
  String CVV;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom, this.CVV);
}

List<CardModel> cards = cardData.map(
  (item) => CardModel(
    item['user'],
    item['cardNumber'],
    item['cardExpired'],
    item['cardType'],
    item['cardBackground'],
    item['cardElementTop'],
    item['cardElementBottom'],
    item['CVV'],
  ),
).toList();

var cardData = [
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "01/23",
    "CVV":"325",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/icons/ellipse_top_pink.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_pink.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "01/25",
    "CVV":"737",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
    "cardElementTop": "assets/icons/ellipse_top_blue.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_blue.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "05/21",
    "CVV":"128",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/icons/ellipse_top_pink.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_pink.svg"
  }
];
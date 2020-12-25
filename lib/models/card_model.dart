class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground1;
  int cardBackground2;
  String cardElementTop;
  String cardElementBottom;
  String CVV;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground1, this.cardBackground2, this.cardElementTop, this.cardElementBottom, this.CVV);
}

List<CardModel> cards = cardData.map(
  (item) => CardModel(
    item['user'],
    item['cardNumber'],
    item['cardExpired'],
    item['cardType'],
    item['cardBackground1'],
    item['cardBackground2'],
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
    "cardBackground1": 0x00FF5F58,
    "cardBackground2": 0xFFB9352F,
    "cardElementTop": "assets/icons/ellipse_top_pink.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_pink.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "01/25",
    "CVV":"737",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground1": 0x77F3CA3E,
    "cardBackground2": 0xFF977500,
    "cardElementTop": "assets/icons/ellipse_top_blue.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_blue.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "05/21",
    "CVV":"128",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground1": 0x779ACBFD,
    "cardBackground2": 0xFF0337EE,
    "cardElementTop": "assets/icons/ellipse_top_pink.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_pink.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "01/23",
    "CVV":"325",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground1": 0x774F4F4F,
    "cardBackground2": 0xFF171616,
    "cardElementTop": "assets/icons/ellipse_top_pink.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_pink.svg"
  },
  {
    "user": "Ini Adegoke",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "01/25",
    "CVV":"737",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground1": 0x772ED239,
    "cardBackground2": 0xFF00640E,
    "cardElementTop": "assets/icons/ellipse_top_blue.svg",
    "cardElementBottom": "assets/icons/ellipse_bottom_blue.svg"
  },
];
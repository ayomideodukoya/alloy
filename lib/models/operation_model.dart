class OperationModel {
  String name;
  String selectedIcon;
  String unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

List<OperationModel> datas = operationsData.map((item) =>
    OperationModel(item['name'], item['selectedIcon'], item['unselectedIcon'])).toList();

var operationsData = [
  {
    "name": "Transaction\nHistory",
    "selectedIcon": "assets/icons/money_transfer_white.svg",
    "unselectedIcon": "assets/icons/money_transfer_blue.svg"
  },
  {
    "name": "Money\nTransfer",
    "selectedIcon": "assets/icons/money_transfer_white.svg",
    "unselectedIcon": "assets/icons/money_transfer_blue.svg"
  },
  {
    "name": "Bank\nWithdraw",
    "selectedIcon": "assets/icons/bank_withdraw_white.svg",
    "unselectedIcon": "assets/icons/bank_withdraw_blue.svg"
  },
  {
    "name": "Insight\nTracking",
    "selectedIcon": "assets/icons/insight_tracking_white.svg",
    "unselectedIcon": "assets/icons/insight_tracking_blue.svg"
  },
];

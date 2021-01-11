import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:alloy/Screens/Transactions/components/chart.dart';
import 'package:alloy/models/transaction_model.dart';
import 'package:alloy/constants.dart';

import 'components/transactions_grid.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'My Transactions',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: TransactionsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            sliver: SliverToBoxAdapter(
              child: TransactionChart(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5, top: 25, right: 8),
              child: Text(
                'Today',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              sliver: SliverToBoxAdapter(
                child: _transactionsSection(),
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5, top: 25, right: 8),
              child: Text(
                'Yesterday',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              sliver: SliverToBoxAdapter(
                child: _transactionsSection(),
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5, top: 25, right: 8),
              child: Text(
                'Friday, 30 January 2020',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              sliver: SliverToBoxAdapter(
                child: _transactionsSection(),
              ))
        ],
      ),
    );
  }

  Container _transactionsSection() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        padding: EdgeInsets.only(left: 16, right: 16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 13),
            padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: kTenBlackColor,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(8.0, 8.0),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(transactions[index].photo))),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          transactions[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor,
                          ),
                        ),
                        Text(
                          transactions[index].date,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      transactions[index].amount,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: transactions[index].debit
                            ? Color(0xFFFF0000)
                            : kBlueColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 3,
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0x441e31e1),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('All'),
              Text('Credits'),
              Text('Debits'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Text('Today'),
              Text('Yesterday'),
              Text('This week'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

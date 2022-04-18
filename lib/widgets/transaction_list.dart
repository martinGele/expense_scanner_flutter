import 'package:expense_scanner_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext buildContext) {
    return SizedBox(
      height: 400,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions !',
                  style: Theme.of(buildContext).textTheme.titleMedium,
                ),
                SizedBox(height: 20,),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(ctx).primaryColor, width: 2)),
                        child: Text(
                          '\$${_userTransactions[index].amount}',
                          style: TextStyle(
                            color: Theme.of(ctx).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userTransactions[index].title,
                            style: Theme.of(ctx).textTheme.titleMedium,
                          ),
                          Text(
                            DateFormat().format(_userTransactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: _userTransactions.length,
              // children: _userTransactions.map((tx) {}).toList(),
            ),
    );
  }
}

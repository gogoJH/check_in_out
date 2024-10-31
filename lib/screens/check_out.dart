import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class CheckOut extends StatelessWidget {
  final Function(String) onCheckOut;
  final bool isCheckedIn;

  const CheckOut(this.onCheckOut, this.isCheckedIn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCheckedIn ? Colors.red : Colors.grey,
          boxShadow: [
            BoxShadow(
              color: isCheckedIn
                  ? Colors.redAccent.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () async {
            String action = '체크아웃 완료';
            await DatabaseHelper().insertRecord(action);
            onCheckOut(action);
          },
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: isCheckedIn ? Colors.red : Colors.grey,
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            isCheckedIn ? '체크아웃' : '체크인 전',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

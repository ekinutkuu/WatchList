import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

Future<String?> showStatusDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select a status:'),
        backgroundColor: PaleBlue,
        //contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusOption(context, "Watching"),
            SizedBox(height: 8.0),
            _buildStatusOption(context, "Completed"),
            SizedBox(height: 8.0),
            _buildStatusOption(context, "On Hold"),
            SizedBox(height: 8.0),
            _buildStatusOption(context, "Dropped"),
            SizedBox(height: 8.0),
            _buildStatusOption(context, "Plan to Watch"),
          ],
        ),
      );
    },
  );
}

Widget _buildStatusOption(BuildContext context, String status) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: DarkBlue,
    ),
    child: ListTile(
      title: Align(
        alignment: Alignment.center,
        child: Text(status, style: TextStyle(fontSize: 17.0),),
      ),
      onTap: () {
        Navigator.pop(context, status);
      },
    ),
  );
}

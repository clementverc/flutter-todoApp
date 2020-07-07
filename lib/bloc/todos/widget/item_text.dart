import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemText extends StatelessWidget {
  final bool check;
  final String text;
  final DateTime dayDate;
  final TimeOfDay timeOfDay;

  ItemText(
    this.check,
    this.text,
    this.dayDate,
    this.timeOfDay,
  );

  Widget _buildText(BuildContext context) {
    if (check) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        _buildDateTimeTexts(context),
      ],
    );
  }

  Widget _buildTimeText(BuildContext context) {
    return Text(
      timeOfDay.format(context),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        color: check ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.yMMMd().format(dayDate).toString(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        color: check ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildDateTimeTexts(BuildContext context) {
    if (dayDate != null && timeOfDay == null) {
      return _buildDateText(context);
    } else if (dayDate != null && timeOfDay != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildDateText(context),
          SizedBox(
            width: 10,
          ),
          _buildTimeText(context),
        ],
      );
    }
    return Container();
    //What would be a better approach?
  }

  @override
  Widget build(BuildContext context) {
    return _buildText(context);
    //Search if it's ok to return something like this :P
  }
}

import 'package:flutter/material.dart';

import '../controller/StickSliverListController.dart';
const stickHeader = 50.0;
class StickHeader extends StatelessWidget {
  final String title;
  final bool showTopButton;
  final VoidCallback? callback;
  final ExpendedModel sectionModel;
  const StickHeader(this.title,
      {Key? key,
        this.showTopButton = false,
        required this.sectionModel,
        this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: stickHeader,
      color: Colors.deepPurple,
      padding: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              sectionModel.sectionTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Visibility(
            visible: showTopButton,
            child: InkWell(
              onTap: () {
                callback?.call();
              },
              child: const Icon(
                Icons.vertical_align_top,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}


class SliverExpandedList extends StatefulWidget {
  final ExpendedModel? expendedModel;
  final String title;
  final int visibleCount;
  final ValueChanged? valueChanged;

   SliverExpandedList(this.expendedModel, this.title,
      {required this.visibleCount, this.valueChanged});

  @override
  _SliverExpandedListState createState() => _SliverExpandedListState();
}

class _SliverExpandedListState extends State<SliverExpandedList> {
  bool expanded = false;

  toTop() {

  }

  getListCount(bool needExpanded) {
    return (expanded)
        ? (needExpanded)
        ? widget.expendedModel!.dataList.length + 2
        : widget.expendedModel!.dataList.length + 1
        : (needExpanded)
        ? widget.visibleCount + 2
        : widget.visibleCount + 1;
  }

  @override
  Widget build(BuildContext context) {
    //展开和控制的逻辑，不需要这个效果
    bool needExpanded = (widget.expendedModel!.dataList.length > 3);
    needExpanded = false;
    List cellList = widget.expendedModel!.dataList;

    return SliverList(
      key: widget.expendedModel!.globalKey,
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          // ///增加bottom
          // if (!expanded && needExpanded && index == widget.visibleCount + 1) {
          //   return renderExpendedMore();
          // }
          // if (index == widget.expendedModel!.dataList.length + 1) {
          //   return renderExpendedMore();
          // }
          // Log.i('cell索引------>$index');

          ///增加header
          if (index == 0) {
            return StickHeader(widget.title,
                sectionModel: widget.expendedModel as ExpendedModel);
          }
          String cellValue = cellList[index - 1] as String;

          ///cell
          return Card(
            child: Container(
              height: 44.0,
              alignment: Alignment.centerLeft,
              child: Text(cellValue),
            ),
          );
        },
        childCount: getListCount(needExpanded),
      ),
    );
  }
}
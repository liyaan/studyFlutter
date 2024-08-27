import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarView extends StatefulWidget implements PreferredSizeWidget {

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final bool centerTitle;
  final bool colorType;
  const AppBarView({
    key,
    this.title = '',
    this.leading ,
    this.actions,
    this.bottom,
    this.elevation = 0.0,
    this.centerTitle = true,
    this.colorType = true,
  }):super(key: key);

  @override
  State<AppBarView> createState() => _AppBarViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: widget.colorType?SystemUiOverlayStyle.dark:SystemUiOverlayStyle.light,
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      leading: widget.leading,
      actions: widget.actions,
      bottom: widget.bottom,
      elevation:widget.elevation
    );
  }
}

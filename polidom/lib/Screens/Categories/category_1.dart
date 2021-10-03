import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Widgets/menu_inferior.dart';

class CategoryOneScreen extends StatefulWidget {
  static const routeName = 'categoryOne';
  const CategoryOneScreen({Key key}) : super(key: key);

  @override
  _CategoryOneScreenState createState() => _CategoryOneScreenState();
}

class _CategoryOneScreenState extends State<CategoryOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Reporte de Policia'),
      ),
      bottomNavigationBar: MenuInferior(
        pageIndex: 0,
      ),
    );
  }
}

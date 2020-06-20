import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Map<String, bool> _currentFilters;
  final Function _setFilters;

  FiltersScreen(this._currentFilters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _lactoseFree;
  bool _vegan;
  bool _vegeterian;

  @override
  void initState() {
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    _vegan = widget._currentFilters['vegan'];
    _vegeterian = widget._currentFilters['veg'];
    super.initState();
  }

  Widget buildFilterSwitchTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.save),
            onPressed: () => widget._setFilters({
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'veg': _vegeterian,
            }),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Select Filters',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          buildFilterSwitchTile(
              'Gluten-free', 'Meals which are gluten free', _glutenFree,
              (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          buildFilterSwitchTile(
              'Lactose-free', 'Meals which are lactose free', _lactoseFree,
              (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          buildFilterSwitchTile('Vegan', 'Meals which are vegan', _vegan,
              (newValue) {
            setState(() {
              _vegan = newValue;
            });
          }),
          buildFilterSwitchTile(
              'Vegeterian', 'Meals which are vegeterian', _vegeterian,
              (newValue) {
            setState(() {
              _vegeterian = newValue;
            });
          }),
        ],
      ),
    );
  }
}

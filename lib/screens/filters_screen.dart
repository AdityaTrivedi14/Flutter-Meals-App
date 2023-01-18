import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({super.key});
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (val) => updateValue(val),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals.', _vegan, (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

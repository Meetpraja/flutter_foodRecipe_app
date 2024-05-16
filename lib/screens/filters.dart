import 'package:flutter/material.dart';

enum Filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filters,bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;
  var _lactoseFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filters.glutenFree]!;
    _veganFilterSet = widget.currentFilters[Filters.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filters.vegetarian]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filters.lactoseFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didpop) async{
          if(didpop) return;
          Navigator.of(context).pop({
            Filters.glutenFree : _glutenFreeFilterSet,
            Filters.lactoseFree : _lactoseFreeFilterSet,
            Filters.vegetarian : _vegetarianFilterSet,
            Filters.vegan : _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              title: const Text(
                'Gluten-free',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              value: _glutenFreeFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _glutenFreeFilterSet = ischecked;
                });
              },
              subtitle: Text(
                'only include gluten-free meals',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              title: const Text(
                'vegan',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              value: _veganFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _veganFilterSet = ischecked;
                });
              },
              subtitle: Text(
                'only include vegan meals',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              title: const Text(
                'vegetarian',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              value: _vegetarianFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _vegetarianFilterSet = ischecked;
                });
              },
              subtitle: Text(
                'only include vegetarian meals',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              title: const Text(
                'lactoseFree',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              value: _lactoseFreeFilterSet,
              onChanged: (ischecked) {
                setState(() {
                  _lactoseFreeFilterSet = ischecked;
                });
              },
              subtitle: Text(
                'only include lactoseFree meals',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}

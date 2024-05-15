import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;
  var _nonVegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your filters'),
      ),
      body: Column(
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
              'non-vegetarian',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            value: _nonVegetarianFilterSet,
            onChanged: (ischecked) {
              setState(() {
                _nonVegetarianFilterSet = ischecked;
              });
            },
            subtitle: Text(
              'only include non-vegetarian meals',
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_recipe/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

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
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
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
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
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
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
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
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
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
    );
  }
}

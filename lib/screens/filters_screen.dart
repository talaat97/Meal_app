

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app2/providers/filter_provider.dart';

 class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Map<Filters, bool> cativeFilters = ref.watch(filterProvider);
    var scaffold = Scaffold(
   
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          CustomeSwitch(
              context,
              'Gluten-food ',
              'only contain the gluten free meals ',
              cativeFilters[Filters.glutenfree], (bool value) {
            {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.glutenfree, value);
            }
          }),
          CustomeSwitch(context, 'Vegan food ', 'only contain the Vegan meals ',
              cativeFilters[Filters.vegan], (bool value) {
            {
              ref.read(filterProvider.notifier).setFilter(Filters.vegan, value);
            }
          }),
          CustomeSwitch(
              context,
              'Vegetarian food ',
              'only contain the Vegetrain meals',
              cativeFilters[Filters.vegetarian], (bool value) {
            {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegetarian, value);
            }
          }),
          CustomeSwitch(
              context,
              'LactoseFree food ',
              'only contain theLactoseFree meals ',
              cativeFilters[Filters.lactoseFree], (bool value) {
            {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.lactoseFree, value);
            }
          }),
        ],
      ),
    );
    return scaffold;
  }

  // ignore: non_constant_identifier_names
  SwitchListTile CustomeSwitch(
      BuildContext context,
      title,
      subtitle,
      filter,
      // ignore: non_constant_identifier_names
      Function(bool NewValue) OnChange) {
    return SwitchListTile(
      value: filter,
      onChanged: OnChange,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}

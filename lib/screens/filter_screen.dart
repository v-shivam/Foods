import 'package:flutter/material.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,
}

class ScreenFilter extends StatefulWidget {
  const ScreenFilter({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<ScreenFilter> createState() {
    return _ScreenFilterState();
  }
}

class _ScreenFilterState extends State<ScreenFilter> {
  var _glutenFreeFilterModify = false;
  var _lactoseFreeFilterModify = false;
  var _veganFilterModify = false;
  var _vegetarianFilterModify = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterModify = widget.currentFilters[Filter.glutenfree]!;
    _lactoseFreeFilterModify = widget.currentFilters[Filter.lactosefree]!;
    _vegetarianFilterModify = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterModify = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: HomeDrawer(
      //   onChooseScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const ButtomTabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenFreeFilterModify,
            Filter.lactosefree: _lactoseFreeFilterModify,
            Filter.vegetarian: _vegetarianFilterModify,
            Filter.vegan: _veganFilterModify,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterModify,
              onChanged: (ispresent) {
                setState(() {
                  _glutenFreeFilterModify = ispresent;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 20),
            ),
            SwitchListTile(
              value: _veganFilterModify,
              onChanged: (ispresent) {
                setState(() {
                  _veganFilterModify = ispresent;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 20),
            ),
            SwitchListTile(
              value: _vegetarianFilterModify,
              onChanged: (ispresent) {
                setState(() {
                  _vegetarianFilterModify = ispresent;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 20),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterModify,
              onChanged: (ispresent) {
                setState(() {
                  _lactoseFreeFilterModify = ispresent;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}

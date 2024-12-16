import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/components/gradient_text.dart';
import 'package:pdslab/misc/destinations.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'package:provider/provider.dart';

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.sizeOf(context).width > 640.0;
}

class NavBar extends StatefulWidget {
  final String title;
  final Widget child;
  const NavBar({super.key, required this.title, required this.child});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    AppBar titleBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Center(
          child: GradientText(
        text: widget.title,
        startColor: Colors.pink,
        endColor: Colors.deepPurpleAccent,
      )),
      actions: [
        IconButton(
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: themeProvider.themeData == darkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode))
      ],
    );

    NavigationRail navRail = NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
        context.go(destinations[index].path);
      },
      labelType: labelType,
      useIndicator: true,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      destinations: destinations.map<NavigationRailDestination>((d) {
        return NavigationRailDestination(
          icon: Icon(
            d.icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: Text(d.label),
        );
      }).toList(),
    );

    NavigationBar bottomNav = NavigationBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
        context.go(destinations[index].path);
      },
      selectedIndex: currentPageIndex,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      destinations: destinations.map<NavigationDestination>((d) {
        return NavigationDestination(
          icon: Icon(
            d.icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: d.label,
        );
      }).toList(),
    );

    if (_isMediumScreen(context)) {
      return Scaffold(
        appBar: titleBar as PreferredSizeWidget,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            navRail,
            Expanded(child: widget.child),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: titleBar as PreferredSizeWidget,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}

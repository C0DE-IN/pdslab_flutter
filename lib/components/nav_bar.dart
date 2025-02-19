import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/components/footer.dart';
import 'package:pdslab/components/gradient_text.dart';
import 'package:pdslab/misc/destinations.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.sizeOf(context).width > 640.0;
}

class NavBar extends ConsumerStatefulWidget {
  final String title;
  final Widget child;
  const NavBar({super.key, required this.title, required this.child});

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  int currentPageIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProviderProvider);

    Widget titleContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'lib/assets/logos/iisc-logo.svg',
            width: 85,
            height: 85,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: GradientText(
              text: widget.title,
              startColor: Colors.pink,
              endColor: Colors.deepPurpleAccent,
            ),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              ref.read(themeProviderProvider.notifier).toggleTheme();
            },
            icon: themeState == darkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
    if (_isMediumScreen(context)) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: 100,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: titleContent,
              ),
            ),
          ],
          body: Row(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.sizeOf(context).height,
                  ),
                  child: IntrinsicHeight(
                    child: NavigationRail(
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
                      destinations:
                          destinations.map<NavigationRailDestination>((d) {
                        return NavigationRailDestination(
                          icon: Icon(
                            d.icon,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          label: Text(d.label),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      primary: false,
                      controller: ScrollController(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: widget.child),
                              const Footer(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Replace the mobile view return statement
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // Title section
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: titleContent,
                ),
                // Content section with scroll handling
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        primary: false,
                        controller: ScrollController(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: widget.child),
                                const Footer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 80, // Adjust height as needed
          ),
          child: IntrinsicHeight(
            child: NavigationBar(
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
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/components/gradient_text.dart';
import 'package:pdslab/misc/destinations.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdslab/components/glass_container.dart';
import 'package:pdslab/components/footer.dart';

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

  Widget _buildMainContent(Widget child) {
    return SingleChildScrollView(
      child: Column(
        children: [
          child,
          const Footer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProviderProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    Widget titleContent = GlassContainer(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.primary,
      opacity: isDarkMode ? 0.15 : 0.7,
      blur: isDarkMode ? 15 : 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 80,
        child: Row(
          children: [
            SvgPicture.asset(
              'lib/assets/logos/iisc-logo.svg',
              width: 60,
              height: 60,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        text: widget.title,
                        startColor: Colors.pink,
                        endColor: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dept. of Biochemistry, Indian Institute of Science, Bangalore',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: width < 600 ? 14 : 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                ref.read(themeProviderProvider.notifier).toggleTheme();
              },
              icon: themeState.brightness == Brightness.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
          ],
        ),
      ),
    );

    if (_isMediumScreen(context)) {
      return Column(
        children: [
          titleContent,
          Expanded(
            child: Row(
              children: [
                GlassContainer(
                  margin: EdgeInsets.zero,
                  borderRadius: BorderRadius.zero,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  opacity: isDarkMode ? 0.15 : 0.7,
                  blur: isDarkMode ? 15 : 10,
                  child: NavigationRail(
                    minWidth: 72,
                    minExtendedWidth: 180,
                    selectedIndex: currentPageIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                      context.go(destinations[index].path);
                    },
                    labelType: width < 800
                        ? NavigationRailLabelType.none
                        : NavigationRailLabelType.all,
                    useIndicator: true,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    destinations: destinations
                        .map((d) => NavigationRailDestination(
                              icon: Icon(
                                d.icon,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              label: Text(
                                d.label,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: _buildMainContent(widget.child),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Mobile view
    return Column(
      children: [
        titleContent,
        Expanded(
          child: _buildMainContent(widget.child),
        ),
        GlassContainer(
          margin: EdgeInsets.zero,
          borderRadius: BorderRadius.zero,
          backgroundColor: Theme.of(context).colorScheme.primary,
          opacity: isDarkMode ? 0.15 : 0.7,
          blur: isDarkMode ? 15 : 10,
          child: NavigationBar(
            height: 65,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
              context.go(destinations[index].path);
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            destinations: destinations
                .map((d) => NavigationDestination(
                      icon: Icon(
                        d.icon,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      label: d.label,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:clothing/presentation/common/widgets/u_liquid_glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _blobSizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..addListener(() => setState(() {}));

    _blobSizeAnimation = Tween<double>(begin: 0.9, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    _controller.forward(from: 0).then((_) => _controller.reverse());
    setState(() => _selectedIndex = index);
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.navigationShell,
          Positioned(bottom: 30, left: 50, right: 50,
            child: ULiquidGlass(
              borderRadius: 30,
              width: MediaQuery.of(context).size.width - 100,
              height: 60,
              child: _buildNavBarContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildNavItem(0, Icons.home),
        _buildNavItem(1, Icons.shopping_cart),
        _buildNavItem(2, Icons.settings),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(width: 90, height: 60,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isSelected)
              const ULiquidGlass(
                blur: 1,
                width: 80,
                height: 40,
                child: Center(
                  child: SizedBox(),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? Color(0xFF1A74E8) : Colors.white,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

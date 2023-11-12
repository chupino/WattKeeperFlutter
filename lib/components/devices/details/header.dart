import 'package:flutter/material.dart';
import 'package:wattkeeper/components/devices/details/headerExpand.dart';
import 'package:wattkeeper/components/devices/details/headerMini.dart';
import 'package:wattkeeper/models/Device.dart';

class DevicesHeader extends SliverPersistentHeaderDelegate {
  final Device device;
  final Size size;

  DevicesHeader({required this.device, required this.size});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final scaleFactor = 1 - shrinkOffset / 200;
    final isCollapsed = shrinkOffset > 100;

    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
              opacity: isCollapsed ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: DeviceDetailsExpandedHeader(
                device: device,
              )),
          AnimatedOpacity(
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: DevicesDetailsHeaderMini(title: device.nombre)),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => size.height * 0.40;

  @override
  // TODO: implement minExtent
  double get minExtent => size.height * 0.15;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}

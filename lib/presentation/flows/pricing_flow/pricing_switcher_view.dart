import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_data.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_item_view.dart';

class PricingSwitcherView extends StatefulWidget {
  const PricingSwitcherView({
    required this.pricingDataList,
    required this.onChanged,
    this.indexInitialData = 0,
    super.key,
  });

  final List<PricingData> pricingDataList;
  final ValueChanged<PricingData> onChanged;
  final int indexInitialData;

  @override
  State<PricingSwitcherView> createState() => _PricingSwitcherViewState();
}

class _PricingSwitcherViewState extends State<PricingSwitcherView> {
  var _indexCurrentData = 0;

  @override
  void initState() {
    _indexCurrentData = widget.indexInitialData;
    super.initState();
  }

  void _onTapItem(PricingData data) {
    _indexCurrentData = widget.pricingDataList.indexOf(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget builderItem(PricingData data) => GestureDetector(
          onTap: () => _onTapItem(data),
          child: PricingItemView(
            isActive: data == widget.pricingDataList[_indexCurrentData],
            data: data,
          ),
        );
    return Column(
      children: widget.pricingDataList.map(
        (data) {
          final isLastElement = (widget.pricingDataList.length - 1) ==
              widget.pricingDataList.indexOf(data);
          return isLastElement
              ? builderItem(data)
              : Column(
                  children: [
                    builderItem(data),
                    const SizedBox(height: 12),
                  ],
                );
        },
      ).toList(),
    );
  }
}

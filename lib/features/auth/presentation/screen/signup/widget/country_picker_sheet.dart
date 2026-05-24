import 'package:flutter/material.dart';

import '../../../../../../core/helper/country_code_model.dart';
import '../../../../../../core/theme/app_color.dart';

class CountryPickerSheet extends StatefulWidget {
  const CountryPickerSheet({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final CountryCodeModel selected;
  final ValueChanged<CountryCodeModel> onSelect;

  @override
  State<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  String query = "";
  late List<CountryCodeModel> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = countryCodes;
  }

  void _onSearch(String q) {
    setState(() {
      query = q;
      _filtered = countryCodes
          .where(
            (c) =>
                c.name.toLowerCase().contains(q.toLowerCase()) ||
                c.code.contains(q),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      builder: (_, scrollController) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Column(
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Search
            TextField(
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: "Search country...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            const SizedBox(height: 12),
            // List
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                itemCount: _filtered.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final country = _filtered[i];
                  final isSelected = country.code == widget.selected.code;
                  return ListTile(
                    leading: Text(
                      country.flag,
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(
                      country.name,
                      style: TextStyle(
                        color: isSelected
                            ? AppColor.blackColor
                            : Colors.black54,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    trailing: Text(
                      country.code,
                      style: TextStyle(
                        color: isSelected
                            ? AppColor.primaryBlueColor
                            : Colors.grey,
                        fontSize: isSelected ? 14 : 12,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.08),
                    onTap: () => widget.onSelect(country),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

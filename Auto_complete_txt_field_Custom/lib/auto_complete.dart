import 'package:flutter/material.dart';

class AutoCompleteTextField<T extends Object> extends StatelessWidget {
  const AutoCompleteTextField({
    Key? key,
    this.label,
    this.validator,
    this.onChanged,
    this.decoration,
    this.onSelected,
    this.initialValue,
    required this.optionsBuilder,
    this.padding = const EdgeInsets.fromLTRB(0, 10, 30, 50),
    this.itemPadding = const EdgeInsets.fromLTRB(20, 0, 20, 0),
    this.displayStringForOption = RawAutocomplete.defaultStringForOption,
  }) : super(key: key);

  final String? label;
  final EdgeInsetsGeometry padding;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry itemPadding;
  final TextEditingValue? initialValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final AutocompleteOnSelected<T>? onSelected;
  final AutocompleteOptionsBuilder<T> optionsBuilder;
  final AutocompleteOptionToString<T> displayStringForOption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Autocomplete<T>(
      onSelected: onSelected,
      initialValue: initialValue,
      displayStringForOption: displayStringForOption,
      optionsMaxHeight: size.height * 0.3,
      optionsBuilder: optionsBuilder,
      fieldViewBuilder: (_, ctrl, node, __) => TextFormField(
        validator: validator,
        decoration: decoration ??
            InputDecoration(
              labelStyle: const TextStyle(fontSize: 18),
              labelText: label,
            ),
        onChanged: onChanged,
        controller: ctrl,
        focusNode: node,
      ),
      optionsViewBuilder: (_, select, datumI) {
        final datum = datumI.toList();
        return ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: 30, maxHeight: size.height * 0.3),
          child: Material(
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: datum.length,
              padding: padding,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: ListTile(
                  title: Text(displayStringForOption(datum[i])),
                  tileColor: Colors.green,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onTap: () => select(datum[i]),
                  contentPadding: itemPadding,
                  dense: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

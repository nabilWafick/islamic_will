import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:islamic_will/views/widgets/textformfield.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ObjectPicker<T> extends StatefulWidget {
  /// Function that performs the search operation and returns a list of objects
  final Future<List<T>?> Function(String query) searchFunction;

  /// Function that converts an object to a displayable string
  final String Function(T item) itemToString;

  /// Callback when an object is selected
  final void Function(T selectedItem) onObjectSelected;

  /// Placeholder text to show when no object is selected
  final String hintText;

  /// Currently selected object (optional)
  final T? initialValue;

  /// Dialog title
  final String dialogTitle;

  /// Search field hint text
  final String searchHint;

  /// Debounce duration for search
  final Duration debounceDuration;

  /// Object Icon
  final Widget? icon;

  /// Enable Selection
  final bool enable;

  const ObjectPicker({
    super.key,
    required this.searchFunction,
    required this.itemToString,
    required this.onObjectSelected,
    this.hintText = 'Sélectionnez un élément',
    this.initialValue,
    this.dialogTitle = 'Rdcherche',
    this.searchHint = 'Rechercher...',
    this.debounceDuration = const Duration(milliseconds: 300),
    this.icon,
    this.enable = true,
  });

  @override
  State<ObjectPicker<T>> createState() => _ObjectPickerState<T>();
}

class _ObjectPickerState<T> extends State<ObjectPicker<T>> {
  T? _selectedObject;

  @override
  void initState() {
    super.initState();
    _selectedObject = widget.initialValue;
  }

  @override
  void didUpdateWidget(ObjectPicker<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _selectedObject = widget.initialValue;
    }
  }

  Future<void> _showSearchDialog() async {
    final T? result = await showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return _ObjectSearchDialog<T>(
          searchFunction: widget.searchFunction,
          itemToString: widget.itemToString,
          title: widget.dialogTitle,
          searchHint: widget.searchHint,
          debounceDuration: widget.debounceDuration,
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedObject = result;
      });
      widget.onObjectSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enable ? _showSearchDialog : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        padding: const EdgeInsets.all(
          AppValues.padding * .7,
        ),
        child: Row(
          children: [
            Expanded(
              child: _selectedObject != null
                  ? AppText(
                      widget.itemToString(_selectedObject as T),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  : AppText(
                      widget.hintText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
            ),
            widget.icon ?? const Icon(Icons.menu),
          ],
        ),
      ),
    );
  }
}

class _ObjectSearchDialog<T> extends StatefulWidget {
  final Future<List<T>?> Function(String query) searchFunction;
  final String Function(T item) itemToString;
  final String title;
  final String searchHint;
  final Duration debounceDuration;

  const _ObjectSearchDialog({
    super.key,
    required this.searchFunction,
    required this.itemToString,
    required this.title,
    required this.searchHint,
    required this.debounceDuration,
  });

  @override
  _ObjectSearchDialogState<T> createState() => _ObjectSearchDialogState<T>();
}

class _ObjectSearchDialogState<T> extends State<_ObjectSearchDialog<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> _searchResults = [];
  bool _isLoading = false;
  String _currentQuery = '';
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _performSearch('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_currentQuery != query) {
      _currentQuery = query;
      _debounceTimer?.cancel();
      _debounceTimer = Timer(widget.debounceDuration, () {
        _performSearch(query);
      });
    }
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final results = await widget.searchFunction(query);
      setState(() {
        _searchResults = results ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        padding: const EdgeInsets.all(AppValues.padding * .7),
        child: Column(
          spacing: 15.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppTextFormField(
              textEditingController: _searchController,
              hintText: widget.searchHint,
              prefixIcon: const Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: "Entrez au moins trois caractères",
                child: Icon(
                  Icons.info_outline,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _onSearchChanged('');
                      },
                    )
                  : null,
              onChanged: (value) {
                if (value != null && value.length >= 3) {
                  _onSearchChanged(value);
                }
              },
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(AppValues.padding * .7),
                child: CupertinoActivityIndicator(
                  color: AppColors.primary,
                  radius: 10.0,
                ),
              )
            else
              Flexible(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = _searchResults[index];
                    return ListTile(
                      title: AppText(
                        widget.itemToString(item),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Navigator.of(context).pop(item);
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 1.0),
            OverflowBar(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const AppText('Annuler'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

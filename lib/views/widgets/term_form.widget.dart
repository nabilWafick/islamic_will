// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/views/widgets/date_picker.widget.dart';
import 'package:islamic_will/views/widgets/dropdown.widget.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:islamic_will/views/widgets/underlined_textformfield.widget.dart';
import 'package:toastification/toastification.dart';

class TermForm extends StatefulWidget {
  final String? cooperativeId;
  final String? producerId;
  final dynamic inialValue;
  final ValueChanged<dynamic> onTermChanged;
  final VoidCallback onTermRemoved;
  final Map<String, dynamic> units;
  TermForm({
    super.key,
    this.cooperativeId,
    this.producerId,
    this.inialValue,
    required this.onTermChanged,
    required this.onTermRemoved,
    required this.units,
  }) {
    assert(
      cooperativeId != null || producerId != null,
      "cooperativeId or producerId must be passed",
    );
  }

  @override
  State<TermForm> createState() => _TermFormState();
}

class _TermFormState extends State<TermForm> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController(), _priceController = TextEditingController();
  dynamic _producer;
  dynamic _crop;
  DateTime? _startDate, _endDate;
  late Unit _unit;
  bool _showData = false;
  bool _canEdit = false;

  @override
  void initState() {
    super.initState();

    String initialUnitKey = '';

    if (widget.inialValue?.unit != null) {
      for (var entry in widget.units.entries) {
        if (entry.value.toString() == widget.inialValue!.unit) {
          initialUnitKey = entry.key;
          break;
        }
      }

      if (initialUnitKey.isEmpty && widget.units.isNotEmpty) {
        initialUnitKey = widget.units.keys.first;
      }
    } else if (widget.units.isNotEmpty) {
      initialUnitKey = widget.units.keys.first;
    }

    setState(() {
      _unit = Unit(
        key: initialUnitKey,
        value: widget.units[initialUnitKey]?.toString() ?? '',
      );
      _canEdit = widget.inialValue == null;
      _quantityController.value =
          TextEditingValue(text: widget.inialValue?.quantity.toString() ?? '');
      _priceController.value = TextEditingValue(text: widget.inialValue?.price.toString() ?? '');
      _startDate = widget.inialValue?.startDate;
      _endDate = widget.inialValue?.endDate;
      _producer = widget.inialValue?.producer;
      _crop = widget.inialValue?.crop;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _quantityController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppValues.padding * .5),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                widget.key.hashCode.toString(),
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
              Row(
                spacing: 5.0,
                children: [
                  IconButton(
                    onPressed: widget.onTermRemoved,
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.primary,
                    ),
                  ),
                  !_canEdit
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _canEdit = !_canEdit;
                            });
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.primary,
                          ),
                        )
                      : const SizedBox(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showData = !_showData;
                      });
                    },
                    icon: Icon(
                      !_showData ? Icons.expand_more : Icons.expand_less,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        _showData
            ? Container(
                padding: const EdgeInsets.all(AppValues.padding * .5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1.0,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 15.0,
                    children: [
                      /*   widget.cooperativeId != null
                          ? ObjectPicker<Producer>(
                              enable: _canEdit,
                              searchFunction: (query) => ProducersService().searchProducers(
                                query: query,
                              ),
                              itemToString: (producer) => producer.fullName ?? "",
                              onObjectSelected: (selectedProducer) {
                                setState(() {
                                  _producer = selectedProducer;
                                });
                              },
                              initialValue: _producer,
                              hintText: 'Sélectionner un producteur',
                              dialogTitle: 'Rechercher un producteur',
                              searchHint: 'Recherche...',
                              icon: Icon(Icons.agriculture, color: AppColors.primary),
                            )
                          : SizedBox(),
                      ObjectPicker<Crop>(
                        enable: _canEdit,
                        searchFunction: (query) => CropsService().search(query: query),
                        itemToString: (crop) => crop.name ?? "",
                        onObjectSelected: (selectedCrop) {
                          setState(() {
                            _crop = selectedCrop;
                          });
                        },
                        initialValue: _crop,
                        hintText: 'Sélectionner une culture',
                        dialogTitle: 'Rechercher une culture',
                        searchHint: 'Recherche...',
                        icon: Icon(Icons.grass, color: AppColors.primary),
                      ),
                     
                     */

                      AppUnderlineTextFormField(
                        enabled: _canEdit,
                        textEditingController: _quantityController,
                        label: "Quantité",
                      ),
                      AppUnderlineTextFormField(
                        enabled: _canEdit,
                        textEditingController: _priceController,
                        label: "Prix",
                      ),
                      AppDateTimePicker(
                        enable: _canEdit,
                        label: "Début",
                        onDateSelect: (value) {
                          setState(() {
                            _startDate = value;
                          });
                        },
                        isNullable: false,
                      ),
                      AppDateTimePicker(
                        enable: _canEdit,
                        label: "Fin",
                        onDateSelect: (value) {
                          setState(() {
                            _endDate = value;
                          });
                        },
                        isNullable: false,
                      ),
                      AppDropdown<String>(
                        enable: _canEdit,
                        label: "Unité",
                        value: _unit.key,
                        itemToString: (key) {
                          return widget.units[key]?.toString() ?? '';
                        },
                        items: widget.units.keys.toList(),
                        onChanged: (key) {
                          if (key != null) {
                            setState(() {
                              _unit = Unit(
                                key: key,
                                value: widget.units[key].toString(),
                              );
                            });
                          }
                        },
                        width: 200.0,
                      ),
                      _canEdit
                          ? AppElevatedButton(
                              text: widget.inialValue == null ? "Ajouter" : "Mettre à jour",
                              onPressed: () {
                                if (widget.cooperativeId != null && _producer == null) {
                                  Helpers.showToast(
                                    style: ToastificationStyle.minimal,
                                    type: ToastificationType.warning,
                                    title: "Invalid",
                                    description: "Le producteur n'a pas été sélectionné",
                                  );
                                } else if (_crop == null) {
                                  Helpers.showToast(
                                    style: ToastificationStyle.minimal,
                                    type: ToastificationType.warning,
                                    title: "Invalid",
                                    description: "La culture n'a pas été sélectionnée",
                                  );
                                } else if (_endDate == null || _startDate == null) {
                                  Helpers.showToast(
                                    style: ToastificationStyle.minimal,
                                    type: ToastificationType.warning,
                                    title: "Invalid",
                                    description: "La période doit être définie",
                                  );
                                } else if (_endDate!.difference(_startDate!).isNegative) {
                                  Helpers.showToast(
                                    style: ToastificationStyle.minimal,
                                    type: ToastificationType.warning,
                                    title: "Invalid",
                                    description: "Période non valide",
                                  );
                                } else if (_formKey.currentState?.validate() ?? true) {
                                  widget.onTermChanged(1);

                                  setState(() {
                                    _canEdit = false;
                                  });
                                }
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class Term {}

class Unit {
  final String key;
  final String value;
  Unit({
    required this.key,
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Unit && other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}

import 'dart:convert';

class EventSite {
  int? eventTypeId;
  int? venueId;
  DateTime? scheduledDatetime;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  String? notes;
  String? normalHours;
  String? overtimeHourlyCharge;
  List<EventSiteSettings>? eventSiteSettings;
  List<EventSiteEmployeeRequirement>? eventSiteEmployeeRequirement;
  String? code;
  String? status;

  EventSite({
    this.eventTypeId,
    this.venueId,
    this.scheduledDatetime,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.notes,
    this.normalHours,
    this.overtimeHourlyCharge,
    this.eventSiteSettings,
    this.eventSiteEmployeeRequirement,
    this.code,
    this.status,
  });

  EventSite.fromJson(Map<String, dynamic> json) {
    eventTypeId = json['event_type_id'];
    venueId = json['venue_id'];
    scheduledDatetime = DateTime.parse(json['scheduled_datetime']);
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    notes = json['notes'];
    normalHours = json['normal_hours'];
    overtimeHourlyCharge = json['overtime_hourly_charge'];
    if (json['event_site_settings'] != null) {
      eventSiteSettings = <EventSiteSettings>[];
      json['event_site_settings'].forEach((v) {
        eventSiteSettings!.add(EventSiteSettings.fromJson(v));
      });
    }
    if (json['event_site_employee_requirement'] != null) {
      eventSiteEmployeeRequirement = <EventSiteEmployeeRequirement>[];
      json['event_site_employee_requirement'].forEach((v) {
        eventSiteEmployeeRequirement!.add(EventSiteEmployeeRequirement.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['event_type_id'] = eventTypeId;
    data['venue_id'] = venueId;
    data['scheduled_datetime'] = scheduledDatetime!.toIso8601String();
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_address'] = customerAddress;
    data['notes'] = notes;
    data['normal_hours'] = normalHours;
    data['overtime_hourly_charge'] = overtimeHourlyCharge;
    if (eventSiteSettings != null) {
      data['event_site_settings'] = eventSiteSettings!.map((v) => v.toJson()).toList();
    }
    if (eventSiteEmployeeRequirement != null) {
      data['event_site_employee_requirement'] = eventSiteEmployeeRequirement!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['status'] = status;
    return data;
  }
}

EventSiteSettings eventSiteSettingsFromJson(String str) => EventSiteSettings.fromJson(json.decode(str));

String eventSiteSettingsToJson(EventSiteSettings data) => json.encode(data.toJson());

class EventSiteSettings {
  int id;
  int eventSite;
  int service;

  EventSiteSettings({
    required this.id,
    required this.eventSite,
    required this.service,
  });

  factory EventSiteSettings.fromJson(Map<String, dynamic> json) => EventSiteSettings(
        id: json["id"],
        eventSite: json["event_site"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_site": eventSite,
        "service": service,
      };
}

class EventSiteEmployeeRequirement {
  int? requirementCount;
  String? charge;
  int? employeeType;

  EventSiteEmployeeRequirement({this.requirementCount, this.charge, this.employeeType});

  EventSiteEmployeeRequirement.fromJson(Map<String, dynamic> json) {
    requirementCount = json['requirement_count'];
    charge = json['charge'];
    employeeType = json['employee_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['requirement_count'] = requirementCount;
    data['charge'] = charge;
    data['employee_type'] = employeeType;
    return data;
  }
}

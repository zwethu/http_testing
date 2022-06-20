// used json to dart convertor

class HolidaysResponse {
  int? status;
  String? warning;
  Requests? requests;
  List<Holidays>? holidays;

  HolidaysResponse({this.status, this.warning, this.requests, this.holidays});

  HolidaysResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    warning = json['warning'];
    requests =
        json['requests'] != null ? Requests.fromJson(json['requests']) : null;
    if (json['holidays'] != null) {
      holidays = <Holidays>[];
      json['holidays'].forEach((v) {
        holidays!.add(Holidays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['warning'] = warning;
    if (requests != null) {
      data['requests'] = requests!.toJson();
    }
    if (holidays != null) {
      data['holidays'] = holidays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  int? used;
  int? available;
  String? resets;

  Requests({this.used, this.available, this.resets});

  Requests.fromJson(Map<String, dynamic> json) {
    used = json['used'];
    available = json['available'];
    resets = json['resets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['used'] = used;
    data['available'] = available;
    data['resets'] = resets;
    return data;
  }
}

class Holidays {
  String? name;
  String? date;
  String? observed;
  bool? public;
  String? country;
  String? uuid;
  Weekday? weekday;

  Holidays({
    this.name,
    this.date,
    this.observed,
    this.public,
    this.country,
    this.uuid,
    this.weekday,
  });

  Holidays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    observed = json['observed'];
    public = json['public'];
    country = json['country'];
    uuid = json['uuid'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    data['observed'] = observed;
    data['public'] = public;
    data['country'] = country;
    data['uuid'] = uuid;
    if (weekday != null) {
      data['weekday'] = weekday!.toJson();
    }
    return data;
  }
}

class Weekday {
  Date? date;
  Date? observed;

  Weekday({this.date, this.observed});

  Weekday.fromJson(Map<String, dynamic> json) {
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    observed =
        json['observed'] != null ? Date.fromJson(json['observed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (observed != null) {
      data['observed'] = observed!.toJson();
    }
    return data;
  }
}

class Date {
  String? name;
  String? numeric;

  Date({this.name, this.numeric});

  Date.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    numeric = json['numeric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['numeric'] = numeric;
    return data;
  }
}

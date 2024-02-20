/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ByMonthResponse monthFromJson(String str) => ByMonthResponse.fromJson(json.decode(str));

String monthToJson(ByMonthResponse data) => json.encode(data.toJson());

class ByMonthResponse {
    ByMonthResponse({
        required this.date,
        required this.times,
        required this.month,
        required this.weekday,
        required this.region,
        required this.regionNumber,
        required this.day,
        required this.hijriDate,
    });

    DateTime date;
    Times times;
    int month;
    String weekday;
    String region;
    int regionNumber;
    int day;
    HijriDate hijriDate;

    factory ByMonthResponse.fromJson(Map<dynamic, dynamic> json) => ByMonthResponse(
        date: DateTime.parse(json["date"]),
        times: Times.fromJson(json["times"]),
        month: json["month"],
        weekday: json["weekday"],
        region: json["region"],
        regionNumber: json["regionNumber"],
        day: json["day"],
        hijriDate: HijriDate.fromJson(json["hijri_date"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "times": times.toJson(),
        "month": month,
        "weekday": weekday,
        "region": region,
        "regionNumber": regionNumber,
        "day": day,
        "hijri_date": hijriDate.toJson(),
    };
}

class HijriDate {
    HijriDate({
        required this.month,
        required this.day,
    });

    String month;
    int day;

    factory HijriDate.fromJson(Map<dynamic, dynamic> json) => HijriDate(
        month: json["month"],
        day: json["day"],
    );

    Map<dynamic, dynamic> toJson() => {
        "month": month,
        "day": day,
    };
}

class Times {
    Times({
        required this.asr,
        required this.quyosh,
        required this.hufton,
        required this.shomIftor,
        required this.tongSaharlik,
        required this.peshin,
    });

    String asr;
    String quyosh;
    String hufton;
    String shomIftor;
    String tongSaharlik;
    String peshin;

    factory Times.fromJson(Map<dynamic, dynamic> json) => Times(
        asr: json["asr"],
        quyosh: json["quyosh"],
        hufton: json["hufton"],
        shomIftor: json["shom_iftor"],
        tongSaharlik: json["tong_saharlik"],
        peshin: json["peshin"],
    );

    Map<dynamic, dynamic> toJson() => {
        "asr": asr,
        "quyosh": quyosh,
        "hufton": hufton,
        "shom_iftor": shomIftor,
        "tong_saharlik": tongSaharlik,
        "peshin": peshin,
    };
}

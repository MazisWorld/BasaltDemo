class Timezone{
  late String timezone;
  late String abbr;
  late String abbr_dst;

  Timezone.fromJson(Map<String, dynamic> json)
      : timezone = json['timeozne'],
        abbr = json['abbr'],
        abbr_dst = json['abbr_dst'];
}
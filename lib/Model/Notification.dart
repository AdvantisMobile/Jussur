

class Notification {
  String new_description;
  String new_discountamount;
  String new_discountpercentage;
  String new_englishdescription;
  String new_englishname;
  String new_freevisits;
  String new_freeweeksfactor;
  String new_jetkpromotionsId;
  String new_name;
  String new_newhourprice;
  String new_promocode;
  String new_validfrom;
  String new_validto;

  Notification({
    this.new_description,
    this.new_discountamount,
    this.new_discountpercentage,
    this.new_englishdescription,
    this.new_englishname,
    this.new_freevisits,
    this.new_freeweeksfactor,
    this.new_jetkpromotionsId,
    this.new_name,
    this.new_newhourprice,
    this.new_promocode,
    this.new_validfrom,
    this.new_validto
});

  factory Notification.fromJSON(Map<String, dynamic> json) {
    return Notification(
      new_description: json['new_description'].toString(),
      new_discountamount: json['new_discountamount'].toString(),
      new_discountpercentage: json['new_discountpercentage'].toString(),
      new_englishname: json['new_englishname'].toString(),
      new_englishdescription: json['new_englishdescription'].toString(),
      new_freevisits: json['new_freevisits'].toString(),
      new_freeweeksfactor: json['new_freeweeksfactor'].toString(),
      new_validto: json['new_validto'].toString(),
      new_validfrom: json['new_validfrom'].toString(),
      new_promocode: json['new_promocode'].toString(),
      new_newhourprice: json['new_newhourprice'].toString(),
      new_name: json['new_name'].toString(),
      new_jetkpromotionsId: json['new_jetkpromotionsId'].toString()
    );
  }

}
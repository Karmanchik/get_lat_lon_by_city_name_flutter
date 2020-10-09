class WeatherDataItem {
    String latt_long;
    String location_type;
    String title;
    int woeid;

    WeatherDataItem({this.latt_long, this.location_type, this.title, this.woeid});

    factory WeatherDataItem.fromJson(Map<String, dynamic> json) {
        return WeatherDataItem(
            latt_long: json['latt_long'], 
            location_type: json['location_type'], 
            title: json['title'], 
            woeid: json['woeid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['latt_long'] = this.latt_long;
        data['location_type'] = this.location_type;
        data['title'] = this.title;
        data['woeid'] = this.woeid;
        return data;
    }
}
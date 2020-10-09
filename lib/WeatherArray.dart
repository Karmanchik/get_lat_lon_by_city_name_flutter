class WeatherArray {
    String latt_long;
    String location_type;
    String title;
    int woeid;

    WeatherArray({this.latt_long, this.location_type, this.title, this.woeid});

    factory WeatherArray.fromJson(Map<String, dynamic> json) {
        return WeatherArray(
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
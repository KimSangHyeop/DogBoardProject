package location;

public class Location { // Userの座標をDBに連動及び貯蔵
	private String id;
	private double lat;
	private double lng;
	
	public Location() {}
	public Location(String id, double lat, double lng) {
		super();
		this.id = id;
		this.lat = lat;
		this.lng = lng;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Location [id=");
		builder.append(id);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", lng=");
		builder.append(lng);
		builder.append("]");
		return builder.toString();
	}
}

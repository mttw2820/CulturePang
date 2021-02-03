package beanPack;
import java.util.*;

public class EventBean {
	private int eventNum;
	private String eventName;
	private int region;
	private String eventCategory;
	private String eventContent;
	private String period;
	
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getRegion() {
		return region;
	}
	public void setRegion(int region) {
		this.region = region;
	}
	public String getEventCategory() {
		return eventCategory;
	}
	public void setEventCategory(String eventCategory) {
		this.eventCategory = eventCategory;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}

}
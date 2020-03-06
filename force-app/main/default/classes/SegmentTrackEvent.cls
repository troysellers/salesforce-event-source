public with sharing class SegmentTrackEvent {
    public SegmentTrackEvent() {
        context = new SegmentContext();
    }

    public String anonymousId {get; set;}
    public SegmentContext context {get; set;}
    public String event {get; set;}
    public Map<String, String> integrations {get; set;}
    private Map<String, String> properties {get; set;}
    public Datetime timestamp {get; set;}
    public String userId {get; set;}

    public void addCustomProperty(String property, String value) {
        if (properties == null) {
            properties = new Map<String, String>();
        }
        properties.put(property,value);
    }
}

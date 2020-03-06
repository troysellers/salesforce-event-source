public with sharing class SegmentPageEvent {
    public SegmentPageEvent() {}

    public String anonymousId {get; set;}
    public SegmentContext context {get; set;}
    public Map<String,String> integrations {get; set;}
    public String name {get; set;}
    public Map<String, String> properties {get; set;}
    public Datetime timestamp {get; set;}
    public String userId {get; set;}
}

public abstract class SegmentBaseEvent {

    public SegmentContext context {get; set;}
    public Map<String, String> integrations {get; set;}
    public Datetime timestamp {get; set;}
    public String userId {get; set;}
}

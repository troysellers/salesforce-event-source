public class SegmentIdentifyEvent extends SegmentBaseEvent{
    /*
        https://segment.com/docs/connections/sources/catalog/libraries/server/http-api/#identify
    */
    public SegmentIdentifyEvent() {}

    public String anonymousId {get; set;}
    public SegmentIdentityTraits traits {get;set;}
}

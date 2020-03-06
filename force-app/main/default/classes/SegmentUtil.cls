public with sharing class SegmentUtil {

    private String trackingWriteKey {get; set;}

    // TODO - load as a remote site configuration
    private String segmentHttpAPIEndpoint = 'https://api.segment.io/v1/';

    public enum SegmentAPIMethod {IDENTIFY, PAGE, TRACK, SCREEN, SEGMENT_GROUP, ALIAS}

    public SegmentUtil(String trackingWriteKey) {
        this.trackingWriteKey = trackingWriteKey;    
    }

    public boolean identify(SegmentIdentifyEvent evt){
        System.debug(LoggingLevel.INFO, JSON.serializePretty(evt, true));
        return post(SegmentAPIMethod.IDENTIFY, JSON.serialize(evt, true));
    }

    public boolean page(SegmentPageEvent evt) {
        System.debug(LoggingLevel.INFO, JSON.serializePretty(evt, true));
        return post(SegmentAPIMethod.PAGE, JSON.serialize(evt,true));
    }

    public boolean track(SegmentTrackEvent evt) {
        System.debug(LoggingLevel.INFO, JSON.serializePretty(evt, true));
        return post(SegmentAPIMethod.TRACK, JSON.serialize(evt,true));
    }

    public boolean screen() {
        System.debug(LoggingLevel.ERROR, 'SegmentUtil.screen() method not yet implemented');
        return false;
    }

    public boolean group() {
        System.debug(LoggingLevel.ERROR, 'SegmentUtil.group() method not yet implemented');
        return false;
    }
    
    public boolean alias() {
        System.debug(LoggingLevel.ERROR, 'SegmentUtil.alias() method not yet implemented');
        return false;
    }

    private boolean post(SegmentAPIMethod method, String jsonStuff) {
        HttpRequest request = new HttpRequest();
        String encoded = EncodingUtil.base64Encode(Blob.valueOf(trackingWriteKey+':'));
        request.setHeader('Authorization', 'Basic '+encoded);
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonStuff);
        request.setMethod('POST');
        String endpoint = '';
        switch on method {
            when  IDENTIFY {
                endpoint = segmentHttpAPIEndpoint + 'identify';
            } 
            when PAGE {
                endpoint = segmentHttpAPIEndpoint + 'page';
            }
            when TRACK {
                endpoint = segmentHttpAPIEndpoint + 'track';
            }
            when SCREEN {
                endpoint = segmentHttpAPIEndpoint + 'screen';
            }
            when ALIAS {
                endpoint = segmentHttpAPIEndpoint + 'alias';
            }
            when SEGMENT_GROUP {
                endpoint = segmentHttpAPIEndpoint + 'group';
            }
            when else {
                return false;
            }
        }
        request.setEndpoint(endpoint);
        Http http = new Http();
        HttpResponse response = http.send(request);
        if (response.getStatusCode() != 200) {
            System.debug(LoggingLevel.WARN, 'Unable to send event to segment : ' + response.getStatus());
            return false;
        } else {
            return true;
        }
    }
}

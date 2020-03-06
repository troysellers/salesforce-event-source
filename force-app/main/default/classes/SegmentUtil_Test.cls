 @isTest(seeAllData=false)
global with sharing class SegmentUtil_Test {
    public SegmentUtil_Test() {}

    @TestSetup
    static void createTestData(){}

    @IsTest
    static void testIdentify(){
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());

        Test.startTest();
        SegmentUtil util = new SegmentUtil('dummy write key');
        SegmentIdentifyEvent evt = new SegmentIdentifyEvent();
        /*
            {
  "userId": "019mr8mf4r",
  "traits": {
    "email": "pgibbons@initech.com",
    "name": "Peter Gibbons",
    "industry": "Technology"
  },
  "context": {
    "ip": "24.5.68.47"
  },
  "timestamp": "2012-12-02T00:30:08.276Z"
}
        */
        evt.userId = '019mr8mf4r';
        
        SegmentIdentityTraits traits = new SegmentIdentityTraits();
        traits.email = 'pgibbons@initech.com';
        traits.name = 'Peter Gibbons';
        traits.addCustomTrait('industry', 'Technology');
        evt.traits = traits;
        
        SegmentContext context = new SegmentContext();
        context.ip = '24.5.68.47';
        evt.context = context;

        System.assert(util.identify(evt)); //returns true if successful
        Test.stopTest();
    }

    @IsTest
    static void testPage(){
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());
        Test.startTest();
        SegmentPageEvent evt = new SegmentPageEvent();
        /*
            {
  "userId": "019mr8mf4r",
  "name": "Tracking HTTP API",
  "timestamp": "2012-12-02T00:31:29.738Z"
}
        */
        evt.userId = '019mr8mf4r';
        evt.name = 'Tracking HTTP API';
        evt.timestamp = Datetime.now();

        SegmentUtil util = new SegmentUtil('dummy write key');
        System.assert(util.page(evt)); //returns true if successful
        Test.stopTest();
    }

    @IsTest
    static void testTrack(){
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());
        Test.startTest();

        SegmentTrackEvent evt = new SegmentTrackEvent();

        /*
{
  "userId": "019mr8mf4r",
  "event": "Item Purchased",
  "properties": {
    "name": "Leap to Conclusions Mat",
    "revenue": 14.99
  },
  "context": {
    "ip": "24.5.68.47"
  },
  "timestamp": "2012-12-02T00:30:12.984Z"
}
        */
        evt.userId = '019mr8mf4r';
        evt.event = 'Item Purchased';
        evt.addCustomProperty('name', 'Leap to Conclusions Mat');
        evt.addCustomProperty('revenue', '14.99');
        
        SegmentContext context = new SegmentContext();
        context.ip = '24.5.68.47';

        evt.timestamp = DateTime.now();

        SegmentUtil util = new SegmentUtil('dummy write key');
        System.assert(util.track(evt)); //returns true if successful
        Test.stopTest();
    }

    @IsTest
    static void testScreen(){
        //TODO - test this
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());
        Test.startTest();
        SegmentUtil util = new SegmentUtil('dummy write key');
        System.assert(!util.screen()); //returns true if successful
        Test.stopTest();
    }

    @IsTest
    static void testAlias(){
        //TODO - test this
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());
        Test.startTest();
        SegmentUtil util = new SegmentUtil('dummy write key');
        System.assert(!util.alias()); //returns true if successful
        Test.stopTest();
    }    

    @IsTest
    static void testGroup(){
        //TODO - test this
        Test.setMock(HttpCalloutMock.class, new SegmentHTTPCalloutMock());
        Test.startTest();
        SegmentUtil util = new SegmentUtil('dummy write key');
        System.assert(!util.group()); //returns true if successful
        Test.stopTest();
    }
    /* 
        HTTPMock for the Segment HTTP API. 
        https://segment.com/docs/connections/sources/catalog/libraries/server/http-api/
    */
    global class SegmentHTTPCalloutMock implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HTTPResponse resp = new HTTPResponse();
            if(req.getHeader('Content-Type') != 'application/json') {
                resp.setStatusCode(400);
            } else if(req.getHeader('Authorization') == null) {
                resp.setStatusCode(400);
            } else if (req.getBodyAsBlob().size() > 16000) {
                resp.setStatusCode(400);
            } else {
                resp.setStatusCode(200);
            }
            return resp;
        }
    }
}





# Segment Salesforce Event Source

This is a simple Salesforce CLI project that shows how you can send events to the Segment HTTP API from within a Salesforce org. 

First, get yourself a [Salesforce developer account](https://developer.salesforce.com/signup). 
The [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) is going to be your next stop.. 

Once your development environment is [configured](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)  
- git clone https://github.com/ibigfoot/salesforce-event-source.git
- cd salesforce-event-source
- sfdx force:auth:web:login -d -a <YOUR DEV HUB ALIAS>
- sfdx:force:org:create -s -a <YOUR SCRATCH ORG ALIAS> -f config/project-scratch-def.json
- sfdx:force:source:push -u <YOUR SCRATCH ORG ALIAS>

Then, setup a Segment [HTTP API source](https://segment.com/docs/connections/sources/catalog/libraries/server/http/)

Example of calling .track() using anonymous apex 
```
SegmentTrackEvent evt = new SegmentTrackEvent();
evt.userId = '019mr8mf4r';
evt.event = 'Item Purchased';
evt.addCustomProperty('name', 'Leap to Conclusions Mat');
evt.addCustomProperty('revenue', '14.99');
        
SegmentContext context = new SegmentContext();
context.ip = '24.5.68.47';

evt.timestamp = DateTime.now();

SegmentUtil util = new SegmentUtil('<YOUR SEGMENT WRITE KEY');
util.track(evt); 
```


Segment API Methods implemented:
- track()
- page()
- identify()


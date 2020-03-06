public with sharing class SegmentContext {
    public SegmentContext() {
        library = new Map<String, String>();
        library.put('name','Salesforce Apex');
        library.put('version','0.1');
    }

    public Boolean active {get; set;}
    public Map<String, String> app {get; set;}
    public Map<String, String> campaign {get; set;}
    public Map<String, String> device {get; set;}
    public String ip {get; set;}
    public Map<String, String> library {get; set;}
    public String locale {get; set;}
    public Map<String, String> location {get; set;}
    public Map<String, String> network {get; set;}
    public Map<String, String> os {get; set;}
    public Map<String, String> page {get; set;}
    public Map<String, String> referrer {get; set;}
    public Map<String, String> screen {get; set;}
    public String timezone {get; set;}
    public String groupId {get; set;}
    public Map<String, String> traits {get; set;}
    public String userAgent {get; set;}
}

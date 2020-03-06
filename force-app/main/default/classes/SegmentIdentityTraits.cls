public with sharing class SegmentIdentityTraits {
    public SegmentIdentityTraits() {}

    public String address {get; set;}
    public Integer age {get; set;}
    public String avatar {get; set;}
    public Date birthday {get; set;}
    public Map<String, String> company {get; set;}
    public Date createdAt {get; set;}
    public String description {get; set;}
    public String email {get; set;}
    public String firstName {get; set;}
    public String gender {get; set;}
    public String id {get; set;}
    public String lastName {get; set;}
    public String name {get; set;}
    public String phone {get; set;}
    public String title {get; set;}
    public String username {get; set;}
    public String website {get; set;}
    private Map<String, String> customTraits {get; set;}

    public void addCustomTrait(String property, String value) {
        if(customTraits == null) {
            customTraits = new Map<String, String>();
        }
        customTraits.put(property, value);
    }
}

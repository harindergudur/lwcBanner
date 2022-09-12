public with sharing class BannerController {

    @AuraEnabled(cacheable = true)
    public static PageBnrWrapper generateBannerDetails(String recordId) {

        PageBnrWrapper newPageBanner = new PageBnrWrapper();
        String queryFields;
        String whereClause = 'ID = :recordId';
        String objtype = String.valueof(Id.valueOf(recordId).getSobjectType());
        List<banner__mdt> banners = new List<banner__mdt>();

        for(Banner_Setting__mdt bs : getBannerDetails(objtype))
        {
            banners = (list<banner__mdt>)bs.Banners__r;
            queryFields = generateQuery(bs.Query_Fields__c , objtype , whereClause);
        }

        if(queryFields <> null && banners.size() > 0)
        {
            newPageBanner.recordData = database.query(queryFields);
            //system.debug('banner*****' + JSON.serialize(newPageBanner.recordData) );
            List<PageBnrWrapperElement> bannerList = new List<PageBnrWrapperElement>();
            for(banner__mdt banner : banners)
            {
                bannerList.add(generateWrapperElement(banner));
            }
            newPageBanner.bannerList = bannerList;
            //system.debug(newPageBanner);
            return newPageBanner;               
        }
        return null;
    } 
    
    private static String generateQuery(String fields, String objName , String whereClause)
    {
        String escapedFields = String.escapeSingleQuotes(fields);
        return 'SELECT ' + escapedFields + ' FROM ' + objName + ' WHERE ' + whereClause + ' LIMIT 1 ' ;
    }

    private static List<Banner_Setting__mdt> getBannerDetails(String objName)
    {
        List<Banner_Setting__mdt> bannerSettings = new List<Banner_Setting__mdt>();
        bannerSettings = [select id,Query_Fields__c,(select id,DeveloperName,Active__c,Banner_Condition__c,Banner_Message__c,Banner_Type__c,Help_Text__c from Banners__r where Active__c = true) from Banner_Setting__mdt where Active__c = true and Object_API_Name__c = :objName limit 1];
        return bannerSettings;
    }

    public static PageBnrWrapperElement generateWrapperElement(banner__mdt banner)
    {
        PageBnrWrapperElement pwElement = new PageBnrWrapperElement();
            pwElement.id = banner.DeveloperName;
            pwElement.msg =  banner.Banner_Message__c;
            pwElement.helptext = banner.Help_Text__c ;
            pwElement.condition = banner.Banner_Condition__c?.replace('.','?.');
            pwElement.type = banner.Banner_Type__c;
        return pwElement;
    }

    public with sharing class PageBnrWrapper {
        @AuraEnabled public sObject recordData;
        @AuraEnabled public List<PageBnrWrapperElement> bannerList;
    }
    public with sharing class PageBnrWrapperElement {
        @AuraEnabled public string id;
        @AuraEnabled public string msg;
        @AuraEnabled public string helptext;
        @AuraEnabled public string condition;
        @AuraEnabled public string type;
    }
}

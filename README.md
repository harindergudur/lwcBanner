
# LWC Banner

A Record page banner that can be placed on any record page and can be configured easly by Admin/BA's and involves no code changes to add/modify/change the criteria of the banner. You can change the condition of the banner just like updating a validation rule. Pull into your scrach org and test it out.


## Screenshots

* Banner

![App Screenshot](/images/contactDemo.png)

![App Screenshot](/images/AccountDemo.png)
Yes! You can add emoji's.








## Examples


Example 1 : Show a banner on the contact page when the account name contains 'Testing'
    
    Steps:
    1. Create custom metadata records -Refer the below custom metadata
        a. Creata a custommeta data record under Banner Setting(Banner_Setting__mdt)
            * Add all the fields used in the condition to Query Fields(Step b)
            * Select the type 
                * Alert(Red)
                * Warn(Orange)
                * Info(Grey)
            * Populate the object API Name Field
         * https://github.com/harindergudur/lwcBanner/blob/main/force-app/main/default/customMetadata/Banner_Setting.Contact_Settings.md-meta.xml
        b.Creata a custommeta data record under Banner(Banner__mdt)
         * Use 'row.' as perfix for each field you use in the condition.
         * git/actual banner setting on Contact
    2. Add the PageBanner lwc component to the Contact page.
    3. Create a new contact on a Account with account name as 'Testing'

![App Screenshot](/images/BannerSetting.png)

![App Screenshot](/images/Banner.png)

![App Screenshot](/images/contactDemo.png)





## 🚀 About Me
I'm a Salesforce developer...
www.linkedin.com/in/gharinder

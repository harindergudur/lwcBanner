
# LWC Banner

A Record page banner that can be placed on any record page and can be configured easly by Admin/BA's and involves no code changes to add/modify/change the criteria of the banner. You can also change the condition of the banner through custom metadata just like updating a validation rule. Pull into your scrach org and test it out.


## Screenshots

* Banner

![App Screenshot](/images/contactDemo.png)

![App Screenshot](/images/AccountDemo.png)
Yes! You can add emoji's.








## Examples


Example 1 : 
*Object - Contact
1.Show a banner on the contact page when the associated account name contains 'Testing'
2.Show a banner when the contact phone number is 1234567890
    
    Steps:
    1. Create custom metadata records for Contact Settings -Refer the below custom metadata
        a. Creata a custommeta data record under Banner Setting(Banner_Setting__mdt)
            * Add all the fields used in the condition to Query Fields(Step b)
            * Select the type 
                * Alert(Red)
                * Warn(Orange)
                * Info(Grey)
            * Populate the object API Name Field
         * https://github.com/harindergudur/lwcBanner/blob/main/force-app/main/default/customMetadata/Banner_Setting.Contact_Settings.md-meta.xml
    2.Creata 2 custommetadata records for each Banner under Banner(banner_mdt).Refer below for the format
         * https://github.com/harindergudur/lwcBanner/blob/main/force-app/main/default/customMetadata/Banner.Test_Contact_Banner.md-meta.xml
         * https://github.com/harindergudur/lwcBanner/blob/main/force-app/main/default/customMetadata/Banner.Test_Contact_Phone.md-meta.xml
         * Notes - 
            * Use 'row.' as perfix for each field you use in the condition.  
            * Keep the Error message simple and short. You can add the longer description in the Help Text field which is mapped to the help icon beside the banner.  
    3. Add the PageBanner lwc component to the Contact page.
    4. Create a new contact on a Account with account name as 'Testing'.You should see the banner with Test you setup in the custommetadata.
    5. Update the phone to '1234567890' and you should see both the banner at top of the page.

![App Screenshot](/images/BannerSetting.png)

![App Screenshot](/images/Banner.png)

![App Screenshot](/images/contactDemo.png)





## 🚀 About Me
I'm a Salesforce developer...
www.linkedin.com/in/harindergudur

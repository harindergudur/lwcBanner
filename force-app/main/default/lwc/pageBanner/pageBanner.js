import { api, LightningElement, wire, track } from 'lwc';
import getBannerDetails from "@salesforce/apex/BannerController.generateBannerDetails";

class wrapperBanner{
    constructor(id,type,msg,helptext){
        this.id = id;
        this.msg = msg;
        this.helptext = helptext;
        this[type] = true;
    }
}

export default class PageBanner extends LightningElement {

    @api recordId;
    @track bannerList = [];
    @wire(getBannerDetails, { recordId: '$recordId'})
    wiredRecord({ error, data }) {
        if (data) {
            this.record = data;
            this.error = undefined;

            if( Object.keys(this.record).length > 0){
                this.generateBannerList(data);     
            }

        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }

    genConditionfromString(inputRecord,str1){
        var row = inputRecord;
        var str = 'return ' + str1;
        try{
            return Function("row",str)(row);
        }
        catch(error){
            console.error('Query or Condition error'+ error);
        }
    }


    generateBannerList(data){
            let bannerList = [...data.bannerList];
            let rcdData = data.recordData;

            console.log('bannerList::::' + JSON.stringify(bannerList));
            console.log('RecordData::::' + JSON.stringify(rcdData));
            for(const bannerData of bannerList)
            {
                let result  = this.genConditionfromString(rcdData, bannerData.condition);
                if(result){
                    this.bannerList.push(new wrapperBanner(bannerData.id,bannerData.type,bannerData.msg,bannerData.helptext));
                }
            }

    }

}
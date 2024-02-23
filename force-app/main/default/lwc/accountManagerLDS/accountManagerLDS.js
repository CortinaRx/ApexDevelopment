import { LightningElement, api, track, wire} from 'lwc';
import { createRecord} from 'lightning/uiRecordApi';
import { getRecord, getFieldValue} from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from "@salesforce/schema/Account.Name"
import PHONE_FIELD from "@salesforce/schema/Account.Phone"
import WEBSITE_FIELD from "@salesforce/schema/Account.Website"

const fieldsArray = ['Account.Name', 'Account.Phone', 'Account.Website'];

export default class AccountManagerLDS extends LightningElement {
        recordId;
        accountName;
        accountPhone;
        accountWebsite;
        @track recordId;



        accountNameChangeHandler(event){
            this.accountName = event.target.value;
        }
        accountPhoneChangeHandler(event){
            this.accountPhone = event.target.value;
        }
        accountWebsiteChangeHandler(event){
            this.accountWebsite = event.target.value;
        }

        @wire(getRecord, {recordId: '$recordId', fields:fieldsArray})
        accountRecord;

        createAccount(){
            const fields = {
                'Name': this.accountName,
                'Phone': this.accountPhone,
                'Website': this.accountWebsite
            };
            const recordInput = {apiName: 'Account', fields}
            createRecord(recordInput).then(response =>{
                this.recordId = response.id;
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Account created, with Id: ' + response.id,
                    variant: 'sucess'
                }))
            }).catch(error =>{
                console.error('Error in Creating Account : ', error.body.message);
            });
        }

        get retAccountName(){
            if(this.accountRecord.data){
                console.log('Esto trae  this.accountRecord.data: ' + this.accountRecord.data);
                return this.accountRecord.data.fields.Name.value;
            }
            return undefined;
        }
        get retAccountPhone(){
            if(this.accountRecord.data){
                return this.accountRecord.data.fields.Phone.value;
            }
            return undefined;
        }
        get retAccountWebsite(){
            if(this.accountRecord.data){
                return this.accountRecord.data.fields.Website.value;
            }
            return undefined;
        }

  
}
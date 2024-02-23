import { LightningElement, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountManager.getAccount'

export default class AccountManageApex extends LightningElement {

    numberOfRecords;
    accounts;
    
   

    get responseReceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }

    numberOfAccountChangeHandler(event){
        this.numberOfRecords = event.target.value
    }

    getAccount(){
        getAllAccounts({numberOfRecords: this.numberOfRecords}).then(result=>{
            this.accounts = result;
        }).catch(error => {
            console.error('Error in getting the accounts', error.body.message);
        })
    }
}
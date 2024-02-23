import { LightningElement, api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'

export default class SpeciesTile extends NavigationMixin(LightningElement) {

   @api specie;
   

   //specie.Location__c = "Indoors" o Outdoors, o ambas juntas separadas por ,
   get isOutdoors() {
    console.log(this.specie.Location__c + 'y esto es ' + this.specie.name)
    return this.specie.Location__c.includes("Outdoors");
    
}

   get isIndoors() {
    return this.specie.Location__c.includes("Indoor");
}

navigateToRecordViewPage() {
    console.log('Redirigiendo a al a002o000019zSMfAAM')
    // View a custom object record.
    this[NavigationMixin.Navigate]({
      type: "standard__recordPage",
      attributes: {
        recordId: this.specie.Id,
        objectApiName: "Species__c", // objectApiName is optional
        actionName: "view",
      },
    });
  }

}
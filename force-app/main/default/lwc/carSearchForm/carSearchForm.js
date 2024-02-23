import { LightningElement, track, wire } from 'lwc';
import getCarTypes from '@salesforce/apex/carSearchFormController.getCarTypes';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class CarSearchForm extends NavigationMixin(LightningElement) {
    @track carTypes;
    selectedValue;

    @wire(getCarTypes)
    wiredCarteType({data,error}){
        this.carTypes = [{value: '', label:'All Types'}];
        if(data){
            data.forEach(element => {
                const carType = {};
                carType.label = element.Name;
                carType.value = element.Id;
                this.carTypes.push(carType);
            });
        }else if(error){
            this.showToast('Error', error.body.message, error);
        }
    }


    handleCarTypeChange(event){
        const carTypeId = event.detail.value;

        const carTypeSelectionChangeEvent = new CustomEvent('cartypeselect', {detail: carTypeId} );
        this.dispatchEvent(carTypeSelectionChangeEvent);
    }

    createNewCarType(){
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
              objectApiName: "Car_Type__c",
              actionName: "new",
            }
          });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant:variant,
        });
        this.dispatchEvent(event);
    }
}
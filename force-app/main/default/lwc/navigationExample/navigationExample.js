import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

export default class NavigationExample extends NavigationMixin(LightningElement) {

    navigationToSFDC(){
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'https://www.google.es'
            },
        });
    }


    
}
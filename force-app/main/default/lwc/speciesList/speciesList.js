import { LightningElement, wire } from 'lwc';
import getFilteredSpecies from "@salesforce/apex/SpeciesService.getFilteredSpecies";

export default class SpeciesList extends LightningElement {
    //Propierties, getter & Setters
    searchText = '';
    
    // LIFE CYCLE Hooks


    //WIRE
    @wire(getFilteredSpecies, { searchText: '$searchText'})
    species;

    //Methods
    handlerInputChange(event){
        const searchTextAux = event.target.value;
        if(searchTextAux.length >= 3 || searchTextAux === ''){
            this.searchText = searchTextAux;
        }
    
    }
}
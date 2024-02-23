import { LightningElement, track } from 'lwc';

export default class BmiCalculator extends LightningElement {
    cardTitle;
    weight;
    height;

    TitleChangeName(){
        this.cardTitle = 'Bmi Ricardo';
        console.log(this.cardTitle);
    }

    @track bmi;

    onWeightChange(event){
        this.weight = event.target.value;
    }

    onHeightChange(event){
        this.height = event.target.value;
    }

    calculateBMI(){
        this.bmi = this.weight / (this.height*this.height);
    }

    get bmiValue(){
        if(this.bmi === undefined){
            return "";
        }
            return `Your BMI is: ${this.bmi}`;
        
     
    }

}
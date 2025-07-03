import { LightningElement } from 'lwc';

export default class CalculateLoanInterest extends LightningElement {
    loanResult;
    principal;
    noOfYears;
    rateOfInt;
    principalAmountHandler(event){
        this.principal = parseInt(event.target.value);
    }
    durationChangeHandler(event){
        this.noOfYears = parseFloat(event.target.value);
    }
    ROIChangeHandler(event){
        this.rateOfInt = parseFloat(event.target.value);
    }
    interestCalculationHandler(){
        this.loanResult = 'The Loan is ' +(this.principal * this.noOfYears * (this.rateOfInt/100));
    }
}
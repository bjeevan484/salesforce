import { LightningElement } from 'lwc';

export default class WelcomeComponent extends LightningElement    {

    letterHandler(event){
        var varValueOfHTMLtoJs = event.target.value;
        alert('You entered the value of : ' +varValueOfHTMLtoJs)
    }
    name = 'Jeevan';
    nameChangeHandler(event){
        this.name = 'Harry';
    }


}
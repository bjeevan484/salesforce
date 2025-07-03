import { LightningElement } from 'lwc';
    
export default class WelcomeToLwc extends LightningElement {
    letterHandler(event){
        var varValueWeGotFromHTML = event.target.value;
        alert(varValueWeGotFromHTML);
    }
}
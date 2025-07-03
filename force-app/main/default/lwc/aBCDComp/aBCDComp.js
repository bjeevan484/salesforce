import { api, LightningElement } from 'lwc';

export default class ABCDComp extends LightningElement {

letterHandler(event){
    var varValueOfHTMLtoJs = event.target.value;
    alert('You entered the value of : ' +varValueOfHTMLtoJs)
}
name = 'Jeevan';
nameChangeHandler(event){

    this.name = 'HarryPotter';


}
BooleanFlagValue = false;
ShowDeals(){
this.BooleanFlagValue = true;
}   
HideDeals(){
    this.BooleanFlagValue = false;
}

}
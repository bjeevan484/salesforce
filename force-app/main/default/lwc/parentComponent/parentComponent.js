import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
       firstname='';
    lastname='';

    handleEvent(event)
    {
        this.firstname=event.detail.FirstName;
        this.lastname=event.detail.LastName;
    }

}
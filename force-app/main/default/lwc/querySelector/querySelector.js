import { LightningElement } from 'lwc';
export default class QuerySelector extends LightningElement {


    fname = '';
    lname = '';

    handleClick(event) {
        var input = this.template.querySelectorAll('lightning-input');

        input.forEach(function (element) {


            if (element.name == "firstname")
                this.fname = element.value

            else if (element.name == "lastname")
                this.lname = element.value

        },
            this);

    }
    handleClear(event) {
        var input = this.template.querySelectorAll('lightning-input');
        input.forEach(function (element) {
            element.value = '';
        }, this);
        this.fname = '';
        this.lname = '';
    }


}
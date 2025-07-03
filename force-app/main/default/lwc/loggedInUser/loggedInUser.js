import { LightningElement, wire } from 'lwc';
import getUserInfo from '@salesforce/apex/LoggedInUser.getUserInfo';
import { NavigationMixin } from 'lightning/navigation';

export default class LoggedInUser extends NavigationMixin(LightningElement) {
    user;

    @wire(getUserInfo)
    wiredUser({ error, data }) {
        if (data) {
            this.user = data;
        } else if (error) {
            console.error('Error:', error);
        }
    }

    handleUserClick() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.user.Id,
                objectApiName: 'User',
                actionName: 'view'
            }
        });
    }
}
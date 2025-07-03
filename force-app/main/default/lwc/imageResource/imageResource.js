import { LightningElement } from 'lwc';

import RandomImageReference from '@salesforce/resourceUrl/RandomImage';

export default class ImageResource extends LightningElement {

    logo = RandomImageReference;
}
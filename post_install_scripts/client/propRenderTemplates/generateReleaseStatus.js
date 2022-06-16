// Copyright 2019 Siemens Product Lifecycle Management Software Inc.

/* global define */

/**
 * native construct to hold the server version information related to the AW server release.
 *
 * @module propRenderTemplates/generateReleaseStatus
 * @requires app
 */
import app from 'app';
import cdm from 'soa/kernel/clientDataModel';
import _ from 'lodash';

var exports = {};

/**
 * Generates Release Status DOM Element
 * @param { Object } vmo - ViewModelObject for which release status is being rendered
 * @param { Object } containerElem - The container DOM Element inside which release status will be rendered
 */
export let releaseStatusRendererFn = function( vmo, containerElem ) {

    var release_status_uids = vmo.props.release_status_list.dbValues;
    _.forEach( release_status_uids, function( release_status_uid ) {
        var releaseStatusBO = cdm.getObject( release_status_uid );
        var releaseStatusName = releaseStatusBO.props.object_name.dbValues[ 0 ];
        var cellImg = document.createElement( 'img' );
        cellImg.className = 'aw-visual-indicator';
        cellImg.title = releaseStatusName;
        var imgSrc = null;
        if( releaseStatusName === 'Approved' ) {
            imgSrc = 'assets/image/indicatorReleasedApproved16.svg';
		} else if( releaseStatusName === 'SP5DocReleased' ) {
            imgSrc = 'assets/image/indicatorSP5DocReleased16.svg';
		} else if( releaseStatusName === 'SP5Development' ) {
            imgSrc = 'assets/image/indicatorSP5Development16.svg';
		} else if( releaseStatusName === 'SP5Production' ) {
            imgSrc = 'assets/image/indicatorSP5Production16.svg';
		} else if( releaseStatusName === 'Rejected' ) {
            imgSrc = 'assets/image/indicatorReleasedRejected16.svg';
        } else if( releaseStatusName === 'TCM Released' ) {
            imgSrc = 'assets/image/indicatorReleasedTCMReleased16.svg';
        }
        cellImg.src = imgSrc;
        cellImg.alt = releaseStatusName;
        containerElem.appendChild( cellImg );
    } );
};

export default exports = {
    releaseStatusRendererFn
};
app.factory( 'generateReleaseStatus', () => exports );

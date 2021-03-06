/*
Copyright (c) 2014, salesforce.com, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
    * Neither the name of the salesforce.com, Inc. nor the names of its contributors
    may be used to endorse or promote products derived from this software
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.

*/
@isTest
private class TestLMSSettings {

    static testMethod void testWithoutCustomSettings(){

        Test.startTest();

            String customLogo = LMSSettings.getCustomLogo();
            System.assert(customLogo == null);
            String headerBackgroundColor = LMSSettings.getHeaderBackgroundColor();
            System.assert(headerBackgroundColor != null);
            String headerTextColor = LMSSettings.getHeaderTextColor();
            System.assert(headerTextColor != null);
            String headerTextHoverColor = LMSSettings.getHeaderTextHoverColor();
            System.assert(headerTextHoverColor != null);
            Boolean disableTrackAchievements = LMSSettings.getDisableTrackAchievements();
            System.assert(disableTrackAchievements == false);
            Boolean disableFutureProgressCalcs = LMSSettings.getDisableFutureProgressCalculation();
            System.assert(disableFutureProgressCalcs == false);
            String backToSFURL = LMSSettings.getBacktoSFUrl();
            System.assert(backToSFURL != null);
            String customHeaderName = LMSSettings.getCustomHeaderName();
            System.assert(customHeaderName == null);
            String customHeaderURL = LMSSettings.getCustomHeaderURL();
            System.assert(customHeaderURL == null);
        Test.stopTest();
    }

    static testMethod void testWithCustomSettings(){

        createTestCustomSetting();

        Test.startTest();

          String customLogo = LMSSettings.getCustomLogo();
          System.assert(customLogo != null);
          String headerBackgroundColor = LMSSettings.getHeaderBackgroundColor();
          System.assert(headerBackgroundColor != null);
          String headerTextColor = LMSSettings.getHeaderTextColor();
          System.assert(headerTextColor != null);
          String headerTextHoverColor = LMSSettings.getHeaderTextHoverColor();
          System.assert(headerTextHoverColor != null);
          Boolean disableTrackAchievements = LMSSettings.getDisableTrackAchievements();
          System.assert(disableTrackAchievements == true);
          Boolean disableFutureProgressCalcs = LMSSettings.getDisableFutureProgressCalculation();
          System.assert(disableFutureProgressCalcs == true);
          String backToSFURL = LMSSettings.getBacktoSFUrl();
          System.assert(backToSFURL != null);
          String customHeaderName = LMSSettings.getCustomHeaderName();
          System.assert(customHeaderName != null);
          String customHeaderURL = LMSSettings.getCustomHeaderURL();
          System.assert(customHeaderURL != null);
        Test.stopTest();
    }

    static void createTestCustomSetting(){
        Almond_Settings__c cs = new Almond_Settings__c();
        cs.Company_Logo__c = 'https://www.salesforce.com/logo.png';
        cs.Header_Background_Color__c = '#2C82B9';
        cs.Header_Text_Color__c = '#DBE5F2';
        cs.Header_Text_Hover_Color__c = '#000000';
        cs.SetupOwnerId = null; //Org-wide default
        cs.Disable_Track_Achievements__c = true;
        cs.Disable_Future_Progress_Calculation__c = true;
        cs.Back_to_SF_URL__c = '/apex/somepage';
        cs.Custom_Section_Name__c = 'Home';
        cs.Custom_Section_URL__c = 'https://instance.salesforce.com/apex/home';
        insert cs;
    }

}

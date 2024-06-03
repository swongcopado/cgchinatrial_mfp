public with sharing class LeadController {

    /*
        *@description This method is used to update Description 
    */
    @AuraEnabled
    public static void updateLead() {
        List<Lead> leadList = new List<Lead>(
            [
                SELECT 
                    id,
                    Name, 
                    Description
                FROM 
                    Lead
                WHERE 
                    Name Like 'Test%'
            ]
        );

        if (!leadList.isEmpty()) {
            for (Lead lead : leadList) {
                if (lead.Description == null) {
                    lead.Description = '123';
                } else {
                    lead.Description += '123';
                }
            }
            update leadList;
        }
    }
}
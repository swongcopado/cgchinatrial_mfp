@isTest
private class LeadControllerTest {
    @isTest
    static void testProcessLeads() {
        Lead testLead1 = new Lead(LastName = 'testLead1', Company = 'Company1');
        Lead testLead2 = new Lead(LastName = 'testLead2', Company = 'Company2', Description = 'Initial Description');
        Lead testLead3 = new Lead(LastName = 'otherLead', Company = 'Company3');
        insert new List<Lead>{testLead1, testLead2, testLead3};
        

        Test.startTest();
        LeadController.updateLead();
        Test.stopTest();
  
        List<Lead> updatedLeads = [SELECT Id, Name, Description FROM Lead WHERE Name LIKE 'Test%'];
        
        System.assertEquals(2, updatedLeads.size(), 'There should be 2 leads with name starting with test');
        for (Lead lead : updatedLeads) {
            if (lead.Name == 'testLead1') {
                System.assertEquals('123', lead.Description, 'Description should be updated to 123');
            } else if (lead.Name == 'testLead2') {
                System.assertEquals('Initial Description123', lead.Description, 'Description should be appended with 123');
            }
        }
    }
}
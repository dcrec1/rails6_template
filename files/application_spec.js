// Example of how to add javascript specs
// 
// require("/jquery.js");
// require("/jquery-ui.js");
// require("/application.js");
// $.ready();
// 
// describe("with main template", function() {
//   template('application.html');
// 
//   describe("on load", function() {
//     beforeEach(function() {
//     });
// 
//     it("should set select as text inputs", function() {
//       expect($("#sign_in")).toBeATextInput();
//     });
// 
//     it("should not set all select as text inputs", function() {
//       expect($("#select")).not.toBeATextInput();
//     });
// 
//     it("should hide the anchor", function() {
//       $("#container a.next").show();
//       $("#container a.next").click();
//       expect($("#playboard a.next")).toBeHidden();
//     });
// 
//     it("should show .matches nav a.prev", function() {
//       $("#container a.prev").hide();
//       $("#container a.next").click();
//       expect($("#playboard a.prev")).toBeVisible();
//     });
// 
//     it("should prevent the event default", function() {
//       expect(eventForSelectorHandler("#container a.prev", "click")).toBeDefaultPrevented();
//     });
//   })
// })
